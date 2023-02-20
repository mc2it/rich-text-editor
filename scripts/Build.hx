/** Builds the project. **/
function main() {
	Sys.command("npx tsc --project src/jsconfig.json");
	Sys.command("npx webpack --config=etc/webpack.js --mode=production");
}
