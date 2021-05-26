## extensions

- [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Go](https://marketplace.visualstudio.com/items?itemName=golang.go)

## settings

```json
{
  "workbench.startupEditor": "none",
  "workbench.iconTheme": "vs-minimal",
  "workbench.tips.enabled": false,
  "workbench.activityBar.visible": false,
  "workbench.editor.tabSizing": "shrink",
  "workbench.editor.untitled.hint": "hidden",
  "workbench.statusBar.visible": false,

  "editor.fontSize": 13,
  "editor.tabSize": 2,
  "editor.fontFamily": "Fira Code",
  "editor.inlineHints.fontFamily": "Fira Code",
  "editor.fontLigatures": true,
  "editor.mouseWheelZoom": true,
  "editor.detectIndentation": false,
  "editor.hover.delay": 500,
  "editor.formatOnSave": true,
  "editor.minimap.enabled": false,
  "editor.glyphMargin": false,
  "editor.smoothScrolling": true,
  "editor.cursorSmoothCaretAnimation": true,
  "editor.wordSeparators": "`~!@#$%^&*()-_=+[{]}\\|;:'\",.<>/?",
  "editor.defaultFormatter": "esbenp.prettier-vscode",

  "files.trimTrailingWhitespace": true,
  "files.trimFinalNewlines": true,
  "files.insertFinalNewline": true,

  "explorer.compactFolders": false,
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,

  "window.zoomLevel": 2,
  "window.menuBarVisibility": "toggle",
  
  "typescript.updateImportsOnFileMove.enabled": "always",
  "javascript.updateImportsOnFileMove.enabled": "always",

  "prettier.singleQuote": true,

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

## snippets

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
  }
}
```
