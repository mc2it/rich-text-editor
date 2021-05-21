package mc2it_rte.cli;

import sys.FileSystem;
import sys.io.File;
import tink.Cli;
import tink.cli.Rest;

using haxe.io.Path;

/** Create a custom build to a given file. **/
class BuildCommand {

	/** Output usage information. **/
	public var help = false;

	/** A comma separated list of languages to embed. **/
	public var languages = "";

	/** Creates a new `copy` command. **/
	public function new() {}

	/** <file> : The path to the output file. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help) return { Sys.println(Cli.getDoc(this)); Noise; };

		final requiredArgs = 1;
		if (rest.length < requiredArgs || (Sys.getEnv("HAXELIB_RUN") == "1" && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output file.");

		final content = [File.getContent(Path.join([Sys.getCwd(), "lib/mc2it_rte.js"]))]
			.concat(getLanguageFiles().map(File.getContent))
			.join("\n");

		FileSystem.createDirectory(Path.directory(rest[0]));
		File.saveContent(rest[0], content);
		return Noise;
	}

	/** Returns the file paths corresponding to the provided languages. **/
	function getLanguageFiles() {
		if (languages.length == 0) return [];

		final i18nDir = Path.join([Sys.getCwd(), "lib/i18n"]);
		final fileNames = languages == "all"
			? FileSystem.readDirectory(i18nDir).map(file -> file.withoutExtension())
			: languages.split(",").map(language -> language.toLowerCase());

		return fileNames.map(fileName -> Path.join([i18nDir, '$fileName.js'])).filter(FileSystem.exists);
	}
}
