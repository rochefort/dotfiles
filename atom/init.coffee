# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

# process.env.PATH = '/Users/trsw/.composer/vendor/bin:/Users/trsw/.nvm/v0.10.29/bin:/Users/trsw/.rbenv/shims:/Users/trsw/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/opt/go/libexec/bin:/Users/trsw/.go/bin'

CANDIDATES = [' => ', ' -> ', '=>', '->']
atom.commands.add 'atom-text-editor', 'fat-arrow:show', ->
  _nextIndex = (selectedText) ->
    return 0 unless selectedText
    index = CANDIDATES.indexOf(selectedText)
    return 0 if (index >= CANDIDATES.length - 1)
    return index + 1

  return unless editor = atom.workspace.getActiveTextEditor()
  editor = atom.workspace.getActivePaneItem()
  selectedText = editor.getSelectedText()
  nextIndex = _nextIndex(selectedText)
  editor.insertText(CANDIDATES[nextIndex], {select: true, undo: 'skip'})
