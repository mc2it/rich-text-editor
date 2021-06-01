import Sys.*;
import sys.FileSystem.*;

/** Runs the script. **/
function main() {
	command("lix download");
	command('npm ${exists("package-lock.json") ? "install" : "update"}');
}
