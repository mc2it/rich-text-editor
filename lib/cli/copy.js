import {cpSync} from "node:fs";
import {fileURLToPath} from "node:url";
import {Command} from "commander";

/**
 * Command copying the library assets to a given directory.
 * @type {Command}
 */
export default new Command("copy")
	.description("Copy the library assets to a given directory.")
	.argument("directory", "the path to the output directory")
	.action(output => cpSync(fileURLToPath(new URL("../../www/js", import.meta.url)), output, {recursive: true}));
