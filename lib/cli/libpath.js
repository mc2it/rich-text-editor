import console from "node:console";
import {fileURLToPath} from "node:url";
import {Command} from "commander";

/**
 * Returns the path to the library assets.
 * @returns {string} The path to the library assets.
 */
export function getAssetPath() {
	return fileURLToPath(new URL("../../www/js", import.meta.url));
}

/**
 * Command printing the path to the library assets.
 * @type {Command}
 */
export default new Command("libpath")
	.description("Print the path to the library assets.")
	.action(() => console.log(getAssetPath()));
