import Sys.*;

/** Runs the script. **/
function main() {
	for (script in ["Clean", "Version"]) command('lix $script');
	for (file in ["build", "run"]) command('haxe $file.hxml');
	putEnv("NODE_ENV", "production");
	command("npx webpack --config=etc/webpack.js");
}
