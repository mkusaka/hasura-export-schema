import fs from "fs";
import path from "path";
import { dirname } from "dirname-filename-esm";

const __dirname = dirname(import.meta);

const ddl = fs.readFileSync(path.join(__dirname, 'ddl.sql'), 'utf8');

console.log(await fetch("localhost:8080/v2/query", {
  method: 'POST',
  body: JSON.stringify({
    "type": "run_sql",
    "args": {
      "source": "default",
      "sql": ddl
    }
  })
}))
