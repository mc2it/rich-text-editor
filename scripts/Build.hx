/** Runs the script. **/
function main() {
	final debug = Sys.args().contains("--debug");
	final flag = debug ? "--debug" : "";
	for (file in ["build", "run"]) Sys.command('haxe $flag $file.hxml');
	Sys.command('npx webpack --config=etc/webpack.mjs --mode=${debug ? "development" : "production"}');
}
