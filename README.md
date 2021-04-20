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
  }
}
```
