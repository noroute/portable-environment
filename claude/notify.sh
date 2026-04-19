#!/bin/bash

if [ -n "$TMUX" ]; then
    CTX=$(tmux display-message -p '#S:#W')
else
    CTX=$(basename "$PWD")
fi

HOOK_DATA=$(cat)
MODE="${1:-stop}"

case "$MODE" in
    permission)
        TOOL=$(echo "$HOOK_DATA" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('tool_name', 'tool'))
" 2>/dev/null || echo "tool")
        MSG="Approval needed: $TOOL"
        ;;
    stop)
        # Don't notify if this stop was triggered by a hook (prevents loops)
        ACTIVE=$(echo "$HOOK_DATA" | python3 -c "
import sys, json
print(json.load(sys.stdin).get('stop_hook_active', False))
" 2>/dev/null)
        [ "$ACTIVE" = "True" ] && exit 0

        TRANSCRIPT=$(echo "$HOOK_DATA" | python3 -c "
import sys, json
print(json.load(sys.stdin).get('transcript_path', ''))
" 2>/dev/null)

        MSG=$(python3 -c "
import json, sys

path = sys.argv[1] if len(sys.argv) > 1 else ''
if not path:
    print('Task complete')
    sys.exit(0)

last_text = ''
try:
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                msg = json.loads(line)
                role = msg.get('role') or msg.get('type', '')
                if role == 'assistant':
                    content = msg.get('content', '')
                    if isinstance(content, list):
                        for part in content:
                            if isinstance(part, dict) and part.get('type') == 'text':
                                t = part.get('text', '')
                                if t:
                                    last_text = t
                    elif isinstance(content, str) and content:
                        last_text = content
            except:
                pass
except:
    pass

if '?' in last_text.strip()[-200:]:
    print('Question / decision needed')
else:
    print('Task complete')
" "$TRANSCRIPT" 2>/dev/null || echo "Task complete")
        ;;
esac

osascript -e "display notification \"$MSG\" with title \"Claude Code\" subtitle \"$CTX\""
