//! --class-path src --library tink_cli --library tink_core
import Sys.*;
import Tools.removeDirectory;
import mc2it_rte.cli.Version.*;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs/api")) removeDirectory("docs/api");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "A custom build of CKEditor, a rich text editor.",
		"--define", "source-path", "https://github.com/mc2it/rich-text-editor/blob/main/src",
		"--define", "themeColor", "0x165898",
		"--define", "version", getPackageVersion(),
		"--define", "website", "https://mc2it.github.io/rich-text-editor",
		"--include", "^ckeditor\\.",
		"--include", "^mc2it_rte\\.",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "MC2IT Rich Text Editor"
	]);

	copy("docs/favicon.ico", "docs/api/favicon.ico");
}
