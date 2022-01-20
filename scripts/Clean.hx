import Tools;
import sys.FileSystem.*;

/** Runs the script. **/
function main() {
	if (exists("lib")) removeDirectory("lib");
	cleanDirectory("var");
}
