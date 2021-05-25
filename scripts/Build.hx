import Sys.*;

/** Runs the script. **/
function main() {
	for (file in ["build", "run"]) command('haxe $file.hxml');
	putEnv("NODE_ENV", "development");
	command("npx webpack --config=etc/webpack.js");
}
