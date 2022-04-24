import {readFile} from "node:fs/promises";
import {program} from "commander";
import copyCommand from "./cli/copy.js";
import libpathCommand from "./cli/libpath.js";

/**
 * Application entry point.
 * @returns {Promise<void>} Resolves when the program is terminated.
 */
export async function main() {
	const {version} = JSON.parse(await readFile(new URL("../package.json", import.meta.url), "utf8"));
	program.name("mc2it_rte")
		.description("Command line interface of MC2IT Rich Text Editor.")
		.version(version, "-v, --version")
		.addCommand(copyCommand)
		.addCommand(libpathCommand)
		.parse(process.argv);
}
