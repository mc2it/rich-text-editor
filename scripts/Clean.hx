import sys.FileSystem;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("lib")) Tools.removeDirectory("lib");
	Tools.cleanDirectory("var");
}
