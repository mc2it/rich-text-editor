//! --class-path src --library tink_cli
import mc2it_rte.cli.Version;
import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("docs")) Tools.removeDirectory("docs");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", [
		"run", "dox",
		"--define", "description", "A custom build of CKEditor, a rich text editor.",
		"--define", "source-path", "https://bitbucket.org/mc2it/rich-text-editor/src/main/src",
		"--define", "themeColor", "0x165898",
		"--define", "version", Version.packageVersion,
		"--define", "website", "https://bitbucket.org/mc2it/rich-text-editor",
		"--include", "^ckeditor\\.*",
		"--include", "^mc2it_rte\\.*",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "MC2IT Rich Text Editor"
	]);

	File.copy("www/favicon.ico", "docs/favicon.ico");
}
