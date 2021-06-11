//! --class-path src --library tink_cli --library tink_core
import mc2it_rte.cli.Version.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final version = getPackageVersion();
	saveContent("package.json", ~/"version": "\d+(\.\d+){2}"/.replace(getContent("package.json"), '"version": "$version"'));
}
