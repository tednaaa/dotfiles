## Extensions

- [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Go](https://marketplace.visualstudio.com/items?itemName=golang.go)

## Settings

```json
{
  "editor.wordSeparators": "`~!@#$%^&*()-_=+[{]}\\|;:'\",.<>/?",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.inlineHints.fontFamily": "Fira Code",
  "editor.cursorSmoothCaretAnimation": true,
  "editor.detectIndentation": false,
  "editor.fontFamily": "Fira Code",
  "editor.minimap.enabled": false,
  "editor.smoothScrolling": true,
  "editor.mouseWheelZoom": true,
  "editor.fontLigatures": true,
  "editor.formatOnSave": true,
  "editor.glyphMargin": false,
  "editor.hover.delay": 500,
  "editor.fontSize": 16,
  "editor.tabSize": 2,

  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,

  "explorer.confirmDragAndDrop": false,
  "explorer.compactFolders": false,
  "explorer.confirmDelete": false,

  "window.menuBarVisibility": "toggle",
  "window.zoomLevel": 1,

  "workbench.editor.tabSizing": "shrink",
  "workbench.startupEditor": "none",

  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",

  "prettier.singleQuote": true,

  "terminal.integrated.fontSize": 17,

  "python.formatting.provider": "autopep8",

  "workbench.editorAssociations": [
    {
      "viewType": "jupyter.notebook.ipynb",
      "filenamePattern": "*.ipynb"
    }
  ],

  "[go]": {
    "editor.defaultFormatter": "golang.go",
    "editor.codeActionsOnSave": {
      "source.organizeImports": true
    }
  },
  "[python]": {
    "editor.defaultFormatter": null,
    "editor.tabSize": 4
  }
}
```

## Snippets

```json
{
  "before": {
    "prefix": "bf",
    "body": "&::before {\n\tcontent: '';\n}"
  },
  "after": {
    "prefix": "af",
    "body": "&::after {\n\tcontent: '';\n}"
  },
  "margin center": {
    "prefix": "mc",
    "body": "margin: 0 auto;"
  },
  "background": {
    "prefix": "bgu",
    "body": "background: url('$0') 0 0 / cover no-repeat;"
  },
  "flexbox justify content": {
    "prefix": "fbs",
    "body": "justify-content: ${0:space-between};"
  },
  "flexbox direction": {
    "prefix": "fbd",
    "body": "flex-direction: ${0:column};"
  },
  "flexbox center": {
    "prefix": "fbc",
    "body": "justify-content: center;\nalign-items: center;"
  },
  "media query": {
    "prefix": "qq",
    "body": "@media (max-width: $0) {\n\t\n}"
  },
  "media query 576px": {
    "prefix": "qq1",
    "body": "@media (max-width: 576px) {\n\t$0\n}"
  },
  "media query 768px": {
    "prefix": "qq2",
    "body": "@media (max-width: 768px) {\n\t$0\n}"
  },
  "media query 992px": {
    "prefix": "qq3",
    "body": "@media (max-width: 992px) {\n\t$0\n}"
  },
  "media query 1200px": {
    "prefix": "qq4",
    "body": "@media (max-width: 1200px) {\n\t$0\n}"
  },

  "try catch": {
    "prefix": "tc",
    "body": "try {\n\t$0\n} catch (error) {\n\tconsole.log(error)\n}"
  },
  "create and export function": {
    "prefix": "cef",
    "body": "export const ${TM_FILENAME_BASE} = () => {\n\t$0\n}"
  }
}
```

## Shortcuts

```json
[
  {
    "key": "ctrl+[Backquote]",
    "command": "workbench.action.terminal.new"
  },
  {
    "key": "ctrl+[Slash]",
    "command": "editor.action.commentLine"
  },
  {
    "key": "shift+alt+up",
    "command": "editor.action.copyLinesUpAction",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "shift+alt+down",
    "command": "editor.action.copyLinesDownAction",
    "when": "editorTextFocus && !editorReadonly"
  }
]
```
