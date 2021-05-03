## extensions
[Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
[ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
[Go](https://marketplace.visualstudio.com/items?itemName=golang.go)
[Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
[WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)

## settings
```json
{
  "workbench.startupEditor": "none",
  "window.zoomLevel": 2,
  "editor.fontSize": 13,
  "editor.tabSize": 2,
  "editor.fontFamily": "Fira Code",
  "editor.inlineHints.fontFamily": "Fira Code",
  "editor.fontLigatures": true,
  "files.autoSave": "afterDelay",
  "editor.mouseWheelZoom": true,
  "editor.detectIndentation": false,
  "editor.hover.delay": 500,
  "editor.formatOnSave": true,
  "workbench.activityBar.visible": false,
  "editor.minimap.enabled": false,
  "workbench.editor.tabSizing": "shrink",
  "editor.glyphMargin": false,
  "editor.smoothScrolling": true,
  "prettier.singleQuote": true,
  "explorer.confirmDelete": false,
  "terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "workbench.statusBar.visible": false,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[go]": {
    "editor.defaultFormatter": "golang.go",
    "editor.codeActionsOnSave": {
      "source.organizeImports": true
    }
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
  }
}
```
