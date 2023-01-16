import {spawn} from "node:child_process";
import {cp, readFile} from "node:fs/promises";
import del from "del";
import gulp from "gulp";

// The file patterns providing the list of source files.
const sources = ["*.js", "bin/*.js", "etc/*.js", "lib/**/*.js"];

/** The default task. */
export default gulp.series(
	clean,
	build
);

/** Builds the project. */
export async function build() {
	await exec("npx", ["tsc", "--project", "lib/jsconfig.json"]);
	return exec("npx", ["webpack", "--config=etc/webpack.js", "--mode=production"]);
}

/** Deletes all generated files. */
export function clean() {
	return del(["share", "var/**/*", "www/js"]);
}

/** Builds the documentation. */
export async function doc() {
	await exec("npx", ["typedoc", "--options", "etc/typedoc.json"]);
	return cp("www/favicon.ico", "docs/favicon.ico");
}

/** Fixes the coding standards issues. */
export function fix() {
	return exec("npx", ["eslint", "--config=etc/eslint.json", "--fix", ...include]);
}

/** Performs the static analysis of source code. */
export function lint() {
	return exec("npx", ["eslint", "--config=etc/eslint.json", ...include]);
}

/** Publishes the package. */
export async function publish() {
	await exec("npm", ["publish"]);
	const {version} = JSON.parse(await readFile("package.json", "utf8"));
	for (const command of [["tag"], ["push", "origin"]]) await exec("git", [...command, `v${version}`]);
}

/** Watches for file changes. */
export function watch() {
	return exec("npx", ["webpack", "watch", "--config=etc/webpack.js", "--mode=development"]);
}

/**
 * Spawns a new process using the specified command.
 * @param {string} command The command to run.
 * @param {string[]} [args] The command arguments.
 * @returns {Promise<void>} Resolves when the command is finally terminated.
 */
function exec(command, args = []) {
	return new Promise((resolve, reject) => spawn(command, args, {shell: true, stdio: "inherit"})
		.on("close", code => code ? reject(Error(args.length ? `${command} ${args.join(" ")}` : command)) : resolve()));
}
