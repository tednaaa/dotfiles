# Setup for my MacBook m1 pro

> Install Brew - https://brew.sh

> Install Fish shell - https://fishshell.com

```
which fish # check path

# set fish as default
echo $path | sudo tee -a /etc/shells
chsh -s $path
```

> Install JetBrains Mono font - https://www.jetbrains.com/lp/mono

> Install Starship prompt - https://starship.rs

> Install asdf to manage multiple runtime versions - https://asdf-vm.com (fish + homebrew)

> Install vscode cask and following extensions

> EditorConfig, ESLint, Prettier, GitLens, Editor & Icon Themes, WakaTime, Quokka + WallabyJS

## Table of Configs

- vscode
  - [Settings](#vscode-settings)
  - [Shortcuts](#vscode-shortcuts)
  - [Snippets](#vscode-snippets)
- [Basic Git Config](#basic-git-config)

### vscode settings

```json
{
  "editor.wordSeparators": "`~!@#$%^&*()-_=+[{]}\\|;:'\",.<>/?",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.acceptSuggestionOnCommitCharacter": true,
  "editor.unicodeHighlight.includeStrings": false,
  "editor.cursorSmoothCaretAnimation": "on",
  "editor.fontFamily": "JetBrains Mono",
  "editor.inlineSuggest.enabled": true,
  "editor.detectIndentation": false,
  "editor.cursorBlinking": "smooth",
  "editor.minimap.enabled": false,
  "editor.smoothScrolling": true,
  "editor.mouseWheelZoom": true,
  "editor.fontLigatures": true,
  "editor.linkedEditing": true,
  "editor.formatOnSave": true,
  "editor.hover.delay": 500,
  "editor.lineHeight": 22,
  "editor.fontSize": 14,
  "editor.tabSize": 2,

  "workbench.colorTheme": "One Dark Pro Darker",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.editor.tabSizing": "shrink",
  "workbench.startupEditor": "none",

  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,

  "explorer.confirmDragAndDrop": false,
  "explorer.compactFolders": false,
  "explorer.confirmDelete": false,

  "window.titleBarStyle": "custom",
  "window.zoomLevel": 1,

  "terminal.integrated.defaultProfile.windows": "Command Prompt",
  "terminal.integrated.fontSize": 14,

  "typescript.updateImportsOnFileMove.enabled": "always",
  "javascript.updateImportsOnFileMove.enabled": "always",

  "emmet.preferences": { "output.reverseAttributes": true },
  "wallaby.suppressExpirationNotifications": true,
  "quokka.suppressExpirationNotifications": true,
  "extensions.ignoreRecommendations": true,
  "scm.defaultViewMode": "tree",
  "prettier.singleQuote": true,

  "[go]": {
    "editor.defaultFormatter": "golang.go"
  }
}
```

### vscode shortcuts

# Shortcuts

```json
[
  {
    "key": "shift+cmd+w",
    "command": "workbench.action.closeEditorsInGroup"
  },
  {
    "key": "shift+cmd+w",
    "command": "-workbench.action.closeWindow"
  },
  {
    "key": "alt+r",
    "command": "editor.action.rename",
    "when": "editorHasRenameProvider && editorTextFocus && !editorReadonly"
  }
]
```

### vscode snippets

```json
{
  "get file name": {
    "prefix": "gfn",
    "body": "${TM_FILENAME_BASE}"
  },
  "UUID": {
    "prefix": "gud",
    "body": "${0:${UUID}}"
  },

  "before": {
    "scope": "scss",
    "prefix": "bf",
    "body": "&::before {\n\tcontent: '';$0\n}"
  },
  "after": {
    "scope": "scss",
    "prefix": "af",
    "body": "&::after {\n\tcontent: '';$0\n}"
  },
  "first child": {
    "scope": "scss",
    "prefix": "fc",
    "body": "&:first-child {\n\t$0\n}"
  },
  "last child": {
    "scope": "scss",
    "prefix": "lc",
    "body": "&:last-child {\n\t$0\n}"
  },
  "not first child": {
    "scope": "scss",
    "prefix": "nfc",
    "body": "&:not(:first-child) {\n\t$0\n}"
  },
  "not last child": {
    "scope": "scss",
    "prefix": "nlc",
    "body": "&:not(:last-child) {\n\t$0\n}"
  },
  "hover": {
    "scope": "scss",
    "prefix": "hv",
    "body": "&:hover {\n\t$0\n}"
  },

  "margin center": {
    "scope": "css,scss",
    "prefix": "mc",
    "body": "margin: 0 auto;"
  },
  "background": {
    "scope": "css,scss",
    "prefix": "bgu",
    "body": "background: url('$0') 0 0 / cover no-repeat;"
  },
  "flexbox justify content": {
    "scope": "css,scss",
    "prefix": "fbs",
    "body": "justify-content: ${0:space-between};"
  },
  "flexbox direction": {
    "scope": "css,scss",
    "prefix": "fbd",
    "body": "flex-direction: ${0:column};"
  },
  "flexbox center": {
    "scope": "css,scss",
    "prefix": "fbc",
    "body": "justify-content: center;\nalign-items: center;"
  },
  "media query": {
    "scope": "css,scss",
    "prefix": "qq",
    "body": "@media (max-width: $0) {\n\t\n}"
  },
  "media query 576px": {
    "scope": "css,scss",
    "prefix": "qq1",
    "body": "@media (max-width: 576px) {\n\t$0\n}"
  },
  "media query 768px": {
    "scope": "css,scss",
    "prefix": "qq2",
    "body": "@media (max-width: 768px) {\n\t$0\n}"
  },
  "media query 992px": {
    "scope": "css,scss",
    "prefix": "qq3",
    "body": "@media (max-width: 992px) {\n\t$0\n}"
  },
  "media query 1200px": {
    "scope": "css,scss",
    "prefix": "qq4",
    "body": "@media (max-width: 1200px) {\n\t$0\n}"
  },

  "console log": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "clg",
    "body": "console.log($0)"
  },
  "arrow function": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "mf",
    "body": ["export const ${TM_FILENAME_BASE} = () => {", "  $0", "};"]
  },
  "reactjs functional component": {
    "scope": "javascriptreact,typescriptreact",
    "prefix": "rafc",
    "body": [
      "import styles from './styles.module.scss';",
      "",
      "export const ${TM_FILENAME_BASE} = () => {",
      "  return (",
      "    <div></div>",
      "  );",
      "};"
    ]
  },
  "RTL template": {
    "scope": "javascriptreact,typescriptreact",
    "prefix": "rtl",
    "body": [
      "import { render } from '@testing-library/react';",
      "import { $0 } from './';",
      "",
      "describe('$0', () => {",
      "  it('should render correctly', () => {",
      "    render(<$0 />);",
      "  });",
      "});"
    ]
  },
  "MUI styled function": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "ms",
    "body": "const Component = styled()(() => ({}));"
  },
  "Vue template": {
    "scope": "vue",
    "prefix": "stv",
    "body": [
      "<script setup lang='ts'></script>"
      "",
      "<template></template>"
      "",
      "<style module lang='scss'></style>"
    ]
  }
}
```

### basic git config

```
[core]
	editor = code --wait
	ignorecase = false
[init]
	defaultBranch = main
[fetch]
	prune = true
[pull]
	rebase = true
[push]
	default = current
```
