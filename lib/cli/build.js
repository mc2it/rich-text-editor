import {existsSync, mkdirSync, readdirSync, readFileSync, writeFileSync} from "node:fs";
import {EOL} from "node:os";
import {dirname, join} from "node:path";
import {fileURLToPath} from "node:url";
import {Command} from "commander";

/**
 * Creates a custom build to a given file.
 * @param {string} output The path to the output file.
 * @param {{languages?: string[]}} [options] The command line options.
 */
export function buildBundle(output, options = {}) {
	mkdirSync(dirname(output), {recursive: true});

	const input = fileURLToPath(new URL("../../www/js", import.meta.url));
	const files = [
		readFileSync(join(input, "mc2it_rte.js"), "utf8"),
		...getLanguageFiles(options?.languages ?? []).map(file => readFileSync(file, "utf8"))
	];

	writeFileSync(output, files.join(EOL));
}

/**
 * Returns the file paths corresponding to the provided languages.
 * @param {string[]} languages The language codes.
 * @returns {string[]} The file paths corresponding to the provided languages that exist.
 */
function getLanguageFiles(languages) {
	if (!languages.length) return [];

	const input = fileURLToPath(new URL("../../www/js/i18n", import.meta.url));
	return languages.at(0) == "all"
		? readdirSync(input).map(file => join(input, file))
		: languages.map(language => `${language.toLowerCase()}.js`).map(file => join(input, file)).filter(existsSync);
}

/**
 * Command creating a custom build to a given file.
 * @type {Command}
 */
export default new Command("build")
	.description("Create a custom build to a given file.")
	.argument("<file>", "the path to the output file")
	.option("-l, --languages <codes>", "a comma separated list of languages to embed", value => value.split(","))
	.action(buildBundle);
