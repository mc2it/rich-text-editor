import {spawn} from "node:child_process";
import {readFile} from "node:fs/promises";
import del from "del";
import gulp from "gulp";

// The file patterns providing the list of source files.
const sources = ["*.js", "bin/*.js", "lib/**/*.js"];

/** The default task. */
export default gulp.series(
	clean,
	build
);

/** Builds the project. */
export function build() {
	return exec("npx", ["webpack", "--config=etc/webpack.js", "--mode=production"]);
}

/** Deletes all generated files and reset any saved state. */
export function clean() {
	return del(["share", "var/**/*", "www/js"]);
}

/** Builds the documentation. */
export async function doc() {
	await del("docs");
	return exec("npx", ["jsdoc", "--configure", "etc/jsdoc.json"]);
}

/** Fixes the coding standards issues. */
export function format() {
	return exec("npx", ["eslint", "--config=etc/eslint.json", "--fix", ...sources]);
}

/** Performs the static analysis of source code. */
export function lint() {
	return exec("npx", ["eslint", "--config=etc/eslint.json", ...sources]);
}

/** Publishes the package in the registry. */
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
 * @return {Promise<void>} Resolves when the command is finally terminated.
 */
function exec(command, args = []) {
	return new Promise((resolve, reject) => spawn(command, args, {shell: true, stdio: "inherit"})
		.on("close", code => code ? reject(new Error(args.length ? `${command} ${args.join(" ")}` : command)) : resolve()));
}
