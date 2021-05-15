package js.ckeditor.core;

/** A collection of commands. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/commandcollection.js", "default")
extern class CommandCollection {

	/** Registers a new command. **/
	function add(name: String, command: Command): Void;

	/** Destroys all collection commands. **/
	function destroy(): Void;

	/** Executes a command. **/
	function execute(name: String, arguments: Rest<Any>): Dynamic;

	/** Retrieves a command from the collection. **/
	function get(name: String): Null<Command>;
}
