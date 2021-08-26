# Snippets

```json
{
  "get File Name": {
    "prefix": "gfn",
    "body": "${TM_FILENAME_BASE}"
  },
  "generate UUID": {
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
    "body": "console.log($0);"
  },
  "create and export function": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "cef",
    "body": "export const ${TM_FILENAME_BASE} = () => {\n\t$0\n};"
  },
  "create react functional component": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "rafc",
    "body": "export const ${TM_FILENAME_BASE} = () => {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t)\n};"
  }
}
```
