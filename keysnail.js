// ========================== KeySnail Init File =========================== //

// You can preserve your code in this area when generating the init file using GUI.
// Put all your code except special key, set*key, hook, blacklist.
// ========================================================================= //
//{{%PRESERVE%
plugins.options["metaplus.metakeys"] = ["ESC"];
//}}%PRESERVE%
// ========================================================================= //

// ========================= Special key settings ========================== //

key.quitKey              = "C-g";
key.helpKey              = "<f1>";
key.escapeKey            = "C-q";
key.macroStartKey        = "<f3>";
key.macroEndKey          = "<f4>";
key.universalArgumentKey = "C-u";
key.negativeArgument1Key = "C--";
key.negativeArgument2Key = "C-M--";
key.negativeArgument3Key = "M--";
key.suspendKey           = "<f2>";

// ================================= Hooks ================================= //


hook.setHook('KeyBoardQuit', function (aEvent) {
    if (key.currentKeySequence.length) return;

    command.closeFindBar();

    let marked = command.marked(aEvent);

    if (util.isCaretEnabled()) {
        if (marked) {
            command.resetMark(aEvent);
        } else {
            if ("blur" in aEvent.target) aEvent.target.blur();

            gBrowser.focus();
            _content.focus();
        }
    } else {
        goDoCommand("cmd_selectNone");
    }

    if (KeySnail.windowType === "navigator:browser" && !marked) {
        key.generateKey(aEvent.originalTarget, KeyEvent.DOM_VK_ESCAPE, true);
    }
});


// ============================= Key bindings ============================== //

key.setGlobalKey([['C-M-r'], ['ESC', 'r']], function (ev) {
                userscript.reload();
            }, 'Reload the initialization file', true);

key.setGlobalKey([['ESC', 'w'], ['M-w']], function (ev) {
                command.copyRegion(ev);
            }, 'Copy selected text', true);

key.setGlobalKey(['ESC', 'ESC'], function (ev, arg) {
            ev.originalTarget.dispatchEvent(key.stringToKeyEvent("ESC", true));
        }, 'Dispatch ESC');

key.setGlobalKey([['ESC', 'x'], ['M-x']], function (ev, arg) {
                ext.select(arg, ev);
            }, 'List exts and execute selected one', true);

key.setGlobalKey([['ESC', ':'], ['M-:']], function (ev) {
                command.interpreter();
            }, 'Command interpreter', true);

key.setGlobalKey([['ESC', 'l'], ['C-M-l']], function (ev) {
                getBrowser().mTabContainer.advanceSelectedTab(1, true);
            }, 'Select next tab');

key.setGlobalKey([['ESC', 'h'], ['C-M-h']], function (ev) {
                getBrowser().mTabContainer.advanceSelectedTab(-1, true);
            }, 'Select previous tab');

key.setGlobalKey(['<f1>', 'b'], function (ev) {
                key.listKeyBindings();
            }, 'List all keybindings');

key.setGlobalKey(['<f1>', 'F'], function (ev) {
                openHelpLink("firefox-help");
            }, 'Display Firefox help');

key.setGlobalKey('C-m', function (ev) {
                key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_RETURN, true);
            }, 'Generate the return key code');

key.setGlobalKey(['C-x', '1'], function (ev) {
    var browser = getBrowser();
    browser.removeAllTabsBut(browser.mCurrentTab);
}, 'Remove all tabs but current tab', true);

key.setGlobalKey(['C-x', '3'], function (ev) {
    BrowserOpenTab();
}, 'Open the new tab');

key.setGlobalKey(['C-x', '5', '2'], function (ev) {
                OpenBrowserWindow();
            }, 'Open new window');

key.setGlobalKey(['C-x', 'l'], function (ev) {
                command.focusToById("urlbar");
            }, 'Focus to the location bar', true);

key.setGlobalKey(['C-x', 'g'], function (ev) {
                command.focusToById("searchbar");
            }, 'Focus to the search bar', true);

key.setGlobalKey(['C-x', 't'], function (ev) {
                command.focusElement(command.elementsRetrieverTextarea, 0);
            }, 'Focus to the first textarea', true);

key.setGlobalKey(['C-x', 's'], function (ev) {
                command.focusElement(command.elementsRetrieverButton, 0);
            }, 'Focus to the first button', true);

key.setGlobalKey(['C-x', 'k'], function (ev) {
                BrowserCloseTabOrWindow();
            }, 'Close tab / window');

key.setGlobalKey(['C-x', 'K'], function (ev) {
                closeWindow(true);
            }, 'Close the window');

key.setGlobalKey(['C-x', 'C-c'], function (ev) {
                goQuitApplication();
            }, 'Exit Firefox', true);

key.setGlobalKey(['C-x', 'o'], function (ev, arg) {
                command.focusOtherFrame(arg);
            }, 'Select next frame');

key.setGlobalKey(['C-x', 'C-f'], function (ev) {
                BrowserOpenFileWindow();
            }, 'Open the local file', true);

key.setGlobalKey(['C-x', 'C-s'], function (ev) {
                saveDocument(window.content.document);
            }, 'Save current page to the file', true);

key.setGlobalKey('C-s', function (ev) {
                command.iSearchForwardKs(ev);
            }, 'Emacs like incremental search forward', true);

key.setGlobalKey('C-r', function (ev) {
                command.iSearchBackwardKs(ev);
            }, 'Emacs like incremental search backward', true);

key.setGlobalKey(['C-c', 'u'], function (ev) {
                undoCloseTab();
            }, 'Undo closed tab');

key.setGlobalKey(['C-c', 'C-c', 'C-v'], function (ev) {
                toJavaScriptConsole();
            }, 'Display JavaScript console', true);

key.setGlobalKey(['C-c', 'C-c', 'C-c'], function (ev) {
                command.clearConsole();
            }, 'Clear Javascript console', true);

key.setViewKey('C-n', function (ev) {
                key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_DOWN, true);
            }, 'Scroll line down');

key.setViewKey('C-p', function (ev) {
                key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_UP, true);
            }, 'Scroll line up');

key.setViewKey('C-f', function (ev) {
                key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_RIGHT, true);
            }, 'Scroll right');

key.setViewKey('C-b', function (ev) {
                key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_LEFT, true);
            }, 'Scroll left');

key.setViewKey([['M-v'], ['b'], ['ESC', 'v']], function (ev) {
                goDoCommand("cmd_scrollPageUp");
            }, 'Scroll page up');

key.setViewKey([['ESC', '<'], ['M-<'], ['g']], function (ev) {
                goDoCommand("cmd_scrollTop");
            }, 'Scroll to the top of the page', true);

key.setViewKey([['ESC', '>'], ['M->'], ['G']], function (ev) {
                goDoCommand("cmd_scrollBottom");
            }, 'Scroll to the bottom of the page', true);

key.setViewKey([['ESC', 'p'], ['M-p']], function (ev) {
                command.walkInputElement(command.elementsRetrieverButton, true, true);
            }, 'Focus to the next button');

key.setViewKey([['ESC', 'n'], ['M-n']], function (ev) {
                command.walkInputElement(command.elementsRetrieverButton, false, true);
            }, 'Focus to the previous button');

key.setViewKey(['ESC', 'ESC'], function (ev, arg) {
            ev.originalTarget.dispatchEvent(key.stringToKeyEvent("ESC", true));
        }, 'Dispatch ESC');

key.setViewKey('C-v', function (ev) {
                goDoCommand("cmd_scrollPageDown");
            }, 'Scroll page down');

key.setViewKey(':', function (ev, arg) {
                shell.input(null, arg);
            }, 'List and execute commands', true);

key.setViewKey('R', function (ev) {
                BrowserReload();
            }, 'Reload the page', true);

key.setViewKey('B', function (ev) {
                BrowserBack();
            }, 'Back');

key.setViewKey('F', function (ev) {
                BrowserForward();
            }, 'Forward');

key.setViewKey(['C-x', 'h'], function (ev) {
                goDoCommand("cmd_selectAll");
            }, 'Select all', true);

key.setViewKey('f', function (ev) {
                command.focusElement(command.elementsRetrieverTextarea, 0);
            }, 'Focus to the first textarea', true);

key.setViewKey(['C-c', 'c'], function (aEvent, aArg) {
    ext.exec("hok-start-foreground-mode", aArg);
}, 'Hok - Foreground hint mode', true);

key.setViewKey(['C-c', 'C-e'], function (aEvent, aArg) {
    ext.exec("hok-start-continuous-mode", aArg);
}, 'Start continuous HaH', true);

key.setViewKey(['C-c', 'y'], function (aEvent, aArg) {
    ext.exec("hok-yank-foreground-mode", aArg);
}, 'Hok - Foreground yank hint mode', true);

key.setViewKey(['C-c', 'l'], function (ev, arg) {
    ext.exec('hok-start-background-mode', arg, ev);
}, 'Start Hit a Hint background mode', true);

key.setViewKey(';', function (aEvent, aArg) {
    ext.exec("hok-start-extended-mode", aArg);
}, 'HoK - Extented hint mode', true);

key.setEditKey(['C-x', 'h'], function (ev) {
                command.selectAll(ev);
            }, 'Select whole text', true);

key.setEditKey([['C-x', 'u'], ['C-_']], function (ev) {
                display.echoStatusBar("Undo!", 2000);
                goDoCommand("cmd_undo");
            }, 'Undo');

key.setEditKey(['C-x', 'r', 'd'], function (ev, arg) {
                command.replaceRectangle(ev.originalTarget, "", false, !arg);
            }, 'Delete text in the region-rectangle', true);

key.setEditKey(['C-x', 'r', 't'], function (ev) {
                prompt.read("String rectangle: ", function (aStr, aInput) {
                                command.replaceRectangle(aInput, aStr);
                            },
                            ev.originalTarget);
            }, 'Replace text in the region-rectangle with user inputted string', true);

key.setEditKey(['C-x', 'r', 'o'], function (ev) {
                command.openRectangle(ev.originalTarget);
            }, 'Blank out the region-rectangle, shifting text right', true);

key.setEditKey(['C-x', 'r', 'k'], function (ev, arg) {
                command.kill.buffer = command.killRectangle(ev.originalTarget, !arg);
            }, 'Delete the region-rectangle and save it as the last killed one', true);

key.setEditKey(['C-x', 'r', 'y'], function (ev) {
                command.yankRectangle(ev.originalTarget, command.kill.buffer);
            }, 'Yank the last killed rectangle with upper left corner at point', true);

key.setEditKey([['C-SPC'], ['C-@']], function (ev) {
                command.setMark(ev);
            }, 'Set the mark', true);

key.setEditKey('C-o', function (ev) {
                command.openLine(ev);
            }, 'Open line');

key.setEditKey('C-\\', function (ev) {
                display.echoStatusBar("Redo!", 2000);
                goDoCommand("cmd_redo");
            }, 'Redo');

key.setEditKey('C-a', function (ev) {
                command.beginLine(ev);
            }, 'Beginning of the line');

key.setEditKey('C-e', function (ev) {
                command.endLine(ev);
            }, 'End of the line');

key.setEditKey('C-f', function (ev) {
                command.nextChar(ev);
            }, 'Forward char');

key.setEditKey('C-b', function (ev) {
                command.previousChar(ev);
            }, 'Backward char');

key.setEditKey([['M-f'], ['ESC', 'f']], function (ev) {
                command.forwardWord(ev);
            }, 'Next word');

key.setEditKey([['ESC', 'b'], ['M-b']], function (ev) {
                command.backwardWord(ev);
            }, 'Previous word');

key.setEditKey([['ESC', 'v'], ['M-v']], function (ev) {
                command.pageUp(ev);
            }, 'Page up');

key.setEditKey([['ESC', '<'], ['M-<']], function (ev) {
                command.moveTop(ev);
            }, 'Beginning of the text area');

key.setEditKey([['ESC', '>'], ['M->']], function (ev) {
                command.moveBottom(ev);
            }, 'End of the text area');

key.setEditKey([['ESC', 'd'], ['M-d']], function (ev) {
                command.deleteForwardWord(ev);
            }, 'Delete forward word');

key.setEditKey([['ESC', '<delete>'], ['C-<backspace>'], ['M-<delete>']], function (ev) {
                command.deleteBackwardWord(ev);
            }, 'Delete backward word');

key.setEditKey([['ESC', 'u'], ['M-u']], function (ev, arg) {
                command.wordCommand(ev, arg, command.upcaseForwardWord, command.upcaseBackwardWord);
            }, 'Convert following word to upper case');

key.setEditKey([['ESC', 'l'], ['M-l']], function (ev, arg) {
                command.wordCommand(ev, arg, command.downcaseForwardWord, command.downcaseBackwardWord);
            }, 'Convert following word to lower case');

key.setEditKey([['ESC', 'c'], ['M-c']], function (ev, arg) {
                command.wordCommand(ev, arg, command.capitalizeForwardWord, command.capitalizeBackwardWord);
            }, 'Capitalize the following word');

key.setEditKey([['ESC', 'y'], ['M-y']], command.yankPop, 'Paste pop (Yank pop)', true);

key.setEditKey([['ESC', 'n'], ['M-n']], function (ev) {
                command.walkInputElement(command.elementsRetrieverTextarea, true, true);
            }, 'Focus to the next text area');

key.setEditKey([['ESC', 'p'], ['M-p']], function (ev) {
                command.walkInputElement(command.elementsRetrieverTextarea, false, true);
            }, 'Focus to the previous text area');

key.setEditKey(['ESC', 'ESC'], function (ev, arg) {
            ev.originalTarget.dispatchEvent(key.stringToKeyEvent("ESC", true));
        }, 'Dispatch ESC');

key.setEditKey('C-M-y', function (ev) {
                if (!command.kill.ring.length)
                    return;

	        let ct = command.getClipboardText();
		if (!command.kill.ring.length || ct != command.kill.ring[0]) {
                    command.pushKillRing(ct);
                }

                prompt.selector(
                    {
                        message: "Paste:",
                        collection: command.kill.ring,
                        callback: function (i) { if (i >= 0) key.insertText(command.kill.ring[i]); }
                    }
                );
            }, 'Show kill-ring and select text to paste', true);

key.setEditKey('C-n', function (ev) {
                command.nextLine(ev);
            }, 'Next line');

key.setEditKey('C-p', function (ev) {
                command.previousLine(ev);
            }, 'Previous line');

key.setEditKey('C-v', function (ev) {
                command.pageDown(ev);
            }, 'Page down');

key.setEditKey('C-d', function (ev) {
                goDoCommand("cmd_deleteCharForward");
            }, 'Delete forward char');

key.setEditKey('C-h', function (ev) {
                goDoCommand("cmd_deleteCharBackward");
            }, 'Delete backward char');

key.setEditKey('C-k', function (ev) {
                command.killLine(ev);
            }, 'Kill the rest of the line');

key.setEditKey('C-y', command.yank, 'Paste (Yank)');

key.setEditKey('C-w', function (ev) {
                goDoCommand("cmd_copy");
                goDoCommand("cmd_delete");
                command.resetMark(ev);
            }, 'Cut current region', true);

key.setCaretKey([['C-a'], ['^']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectBeginLine") : goDoCommand("cmd_beginLine");
            }, 'Move caret to the beginning of the line');

key.setCaretKey([['C-e'], ['$'], ['M->'], ['G'], ['ESC', '>']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectEndLine") : goDoCommand("cmd_endLine");
            }, 'Move caret to the end of the line');

key.setCaretKey([['ESC', 'f'], ['M-f'], ['w']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectWordNext") : goDoCommand("cmd_wordNext");
            }, 'Move caret to the right by word');

key.setCaretKey([['ESC', 'b'], ['M-b'], ['W']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectWordPrevious") : goDoCommand("cmd_wordPrevious");
            }, 'Move caret to the left by word');

key.setCaretKey([['ESC', 'v'], ['M-v'], ['b']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectPagePrevious") : goDoCommand("cmd_movePageUp");
            }, 'Move caret up by page');

key.setCaretKey([['ESC', '<'], ['M-<'], ['g']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectTop") : goDoCommand("cmd_scrollTop");
            }, 'Move caret to the top of the page');

key.setCaretKey([['ESC', 'p'], ['M-p']], function (ev) {
                command.walkInputElement(command.elementsRetrieverButton, true, true);
            }, 'Focus to the next button');

key.setCaretKey([['ESC', 'n'], ['M-n']], function (ev) {
                command.walkInputElement(command.elementsRetrieverButton, false, true);
            }, 'Focus to the previous button');

key.setCaretKey(['ESC', 'ESC'], function (ev, arg) {
            ev.originalTarget.dispatchEvent(key.stringToKeyEvent("ESC", true));
        }, 'Dispatch ESC');

key.setCaretKey([['C-n'], ['j']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectLineNext") : goDoCommand("cmd_scrollLineDown");
            }, 'Move caret to the next line');

key.setCaretKey([['C-p'], ['k']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectLinePrevious") : goDoCommand("cmd_scrollLineUp");
            }, 'Move caret to the previous line');

key.setCaretKey([['C-f'], ['l']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectCharNext") : goDoCommand("cmd_scrollRight");
            }, 'Move caret to the right');

key.setCaretKey([['C-b'], ['h'], ['C-h']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectCharPrevious") : goDoCommand("cmd_scrollLeft");
            }, 'Move caret to the left');

key.setCaretKey([['C-v'], ['SPC']], function (ev) {
                ev.target.ksMarked ? goDoCommand("cmd_selectPageNext") : goDoCommand("cmd_movePageDown");
            }, 'Move caret down by page');

key.setCaretKey('J', function (ev) {
                util.getSelectionController().scrollLine(true);
            }, 'Scroll line down');

key.setCaretKey('K', function (ev) {
                util.getSelectionController().scrollLine(false);
            }, 'Scroll line up');

key.setCaretKey(',', function (ev) {
                util.getSelectionController().scrollHorizontal(true);
                goDoCommand("cmd_scrollLeft");
            }, 'Scroll left');

key.setCaretKey('.', function (ev) {
                goDoCommand("cmd_scrollRight");
                    util.getSelectionController().scrollHorizontal(false);
            }, 'Scroll right');

key.setCaretKey('z', function (ev) {
                command.recenter(ev);
            }, 'Scroll to the cursor position');

key.setCaretKey([['C-SPC'], ['C-@']], function (ev) {
                command.setMark(ev);
            }, 'Set the mark', true);

key.setCaretKey(':', function (ev, arg) {
                shell.input(null, arg);
            }, 'List and execute commands', true);

key.setCaretKey('R', function (ev) {
                BrowserReload();
            }, 'Reload the page', true);

key.setCaretKey('B', function (ev) {
                BrowserBack();
            }, 'Back');

key.setCaretKey('F', function (ev) {
                BrowserForward();
            }, 'Forward');

key.setCaretKey(['C-x', 'h'], function (ev) {
                goDoCommand("cmd_selectAll");
            }, 'Select all', true);

key.setCaretKey('f', function (ev) {
                command.focusElement(command.elementsRetrieverTextarea, 0);
            }, 'Focus to the first textarea', true);
