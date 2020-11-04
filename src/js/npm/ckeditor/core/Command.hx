package js.npm.ckeditor.core;

import haxe.DynamicAccess;
import js.npm.ckeditor.core.editor.Editor;

/** The base class for CKEditor commands. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/command.js", "default")
extern class Command {

	/** The editor instance. **/
	final editor: Editor;

	/** Value indicating whether this command is enabled or disabled. **/
	var isEnabled: Bool;

	/** Executes this command. **/
	function execute(?parameters: DynamicAccess<Any>): Void;

	/** Refreshes this command. **/
	function refresh(): Void;
}
