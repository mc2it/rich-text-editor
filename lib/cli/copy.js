import {cpSync} from "node:fs";
import {fileURLToPath} from "node:url";
import {Command} from "commander";

/**
 * Copies the library assets to a given directory.
 * @param {string} output The path to the output directory.
 */
export function copyAssets(output) {
	cpSync(fileURLToPath(new URL("../../www/js", import.meta.url)), output, {recursive: true});
}

/**
 * Command copying the library assets to a given directory.
 * @type {Command}
 */
export default new Command("copy")
	.description("Copy the library assets to a given directory.")
	.argument("directory", "the path to the output directory")
	.action(copyAssets);
