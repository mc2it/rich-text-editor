import sys.FileSystem;
using Lambda;

/** Deletes all generated files. **/
function main() {
	["lib", "www/js"].filter(FileSystem.exists).iter(Tools.removeDirectory);
	Tools.cleanDirectory("var");
}
