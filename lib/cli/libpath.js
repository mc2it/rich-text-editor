import console from "node:console";
import {fileURLToPath} from "node:url";
import {Command} from "commander";

/**
 * Command printing the path to the library assets.
 * @type {Command}
 */
export default new Command("libpath")
	.description("Print the path to the library assets.")
	.action(() => console.log(fileURLToPath(new URL("../../www/js", import.meta.url))));
