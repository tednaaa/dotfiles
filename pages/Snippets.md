# Snippets

```json
  "create reactjs functional component": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "rafc",
    "body": [
      "import React from 'react';",
      "import './${TM_FILENAME_BASE}.scss';",
      "",
      "export const ${TM_FILENAME_BASE} = (props) => {",
      "  return (",
      "    <div {...props} className={clsx('${0:${TM_FILENAME_BASE}}', props.className)}>",
      "      {props.children}",
      "    </div>",
      "  );",
      "};"
    ]
  }
```
