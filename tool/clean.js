import {rmSync} from "node:fs";
import {cleanDirectory} from "./tools.js";

/**
 * Deletes all generated files.
 */
["lib", "www/js"].forEach(item => rmSync(item, {force: true, recursive: true}));
cleanDirectory("var");
