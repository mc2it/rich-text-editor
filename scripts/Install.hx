import sys.FileSystem;

/** Runs the script. **/
function main() {
	Sys.command("lix download");
	Sys.command('npm ${FileSystem.exists("package-lock.json") ? "install" : "update"}');
}
