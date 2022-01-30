import sys.FileSystem.*;

/** Runs the script. **/
function main() {
	if (exists("lib")) Tools.removeDirectory("lib");
	Tools.cleanDirectory("var");
}
