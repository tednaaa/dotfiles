# Snippets

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

  "create and export function": {
    "prefix": "cef",
    "body": "export const ${TM_FILENAME_BASE} = () => {\n\t$0\n}"
  },
  "create react functional component": {
    "prefix": "rafc",
    "body": "export const ${TM_FILENAME_BASE} = () => {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t)\n}"
  }
}
```
