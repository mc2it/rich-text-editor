package js.npm.ckeditor.core;

import js.npm.ckeditor.core.editor.Editor;

/** The base class for CKEditor commands. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/command.js", "default")
extern class Command {

	/** The editor instance. **/
	final editor: Editor;

	/** Value indicating whether this command is enabled or disabled. **/
	var isEnabled: Bool;

	/** Creates a new command. **/
	function new(editor: Editor);

	/** Destroys this command. **/
	function destroy(): Void;

	/** Refreshes this command. **/
	function refresh(): Void;
}
