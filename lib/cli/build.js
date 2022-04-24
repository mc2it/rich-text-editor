import {Command} from "commander";

/**
 * Creates a custom build to a given file.
 * @param {string} output The path to the output file.
 */
export function buildFile(output) {
	// TODO
}

/**
 * Command creating a custom build to a given file.
 * @type {Command}
 */
export default new Command("build")
	.description("Create a custom build to a given file.")
	.argument("file", "the path to the output file")
	.action(buildFile);
