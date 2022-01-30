//! --class-path src --library tink_cli
import mc2it_rte.cli.Version.*;

/** Runs the script. **/
function main()
	Tools.replaceInFile("package.json", ~/"version": "\d+(\.\d+){2}"/, '"version": "$packageVersion"');
