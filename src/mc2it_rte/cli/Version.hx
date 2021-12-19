package mc2it_rte.cli;

#if macro
import haxe.Json;
import haxe.macro.Context;
import sys.io.File;
import sys.io.Process;
#end

/** Defines the Haxe compilation target. **/
enum abstract HaxeTarget(String) from String {

	/** The compilation target is C++. **/
	var CPlusPlus = "cpp";

	/** The compilation target is C#. **/
	var CSharp = "cs";

	/** The compilation target is Eval. **/
	var Eval = "eval";

	/** The compilation target is HashLink. **/
	var HashLink = "hl";

	/** The compilation target is Java / JVM. **/
	var Java = "java";

	/** The compilation target is JavaScript. **/
	var JavaScript = "js";

	/** The compilation target is Lua. **/
	var Lua = "lua";

	/** The compilation target is Neko. **/
	var Neko = "neko";

	/** The compilation target is PHP. **/
	var PHP = "php";

	/** The compilation target is Python. **/
	var Python = "python";
}

/** Provides information about the program version. **/
abstract class Version {

	/** The hash of the current Git commit. **/
	public static var gitCommitHash(get, null): String;

	/** The name of the Haxe target. **/
	public static var haxeTarget(get, never): HaxeTarget;

	/** The version of the Haxe compiler. **/
	public static var haxeVersion(get, never): String;

	/** The package version of this program. **/
	public static var packageVersion(get, null): String;

	/** Gets the hash of the current Git commit. **/
	static function get_gitCommitHash() {
		if (gitCommitHash == null) gitCommitHash = getGitCommitHash();
		return gitCommitHash;
	}

	/** Gets the name of the Haxe target. **/
	static inline function get_haxeTarget() return getHaxeTarget();

	/** Gets the version of the Haxe compiler. **/
	static inline function get_haxeVersion() return getHaxeVersion();

	/** Gets the package version of this program. **/
	static function get_packageVersion() {
		if (packageVersion == null) packageVersion = getPackageVersion();
		return packageVersion;
	}

	/** Gets the hash of the current Git commit. **/
	macro static function getGitCommitHash() {
		#if display
			return macro $v{""};
		#else
			final process = new Process("git", ["rev-parse", "HEAD"]);
			final hash = process.exitCode() == 0 ? process.stdout.readLine() : process.stderr.readLine();
			process.close();
			return macro $v{hash};
		#end
	}

	/** Gets the name of the Haxe target. **/
	macro static inline function getHaxeTarget()
		return macro $v{Context.definedValue("target.name")};

	/** Gets the version of the Haxe compiler. **/
	macro static inline function getHaxeVersion()
		return macro $v{Context.definedValue("haxe")};

	/** Gets the package version of this program. **/
	macro static inline function getPackageVersion()
		return macro $v{#if display "0.0.0" #else Json.parse(File.getContent("haxelib.json")).version #end};
}
