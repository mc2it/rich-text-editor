package js.npm.ckeditor.core;

import js.npm.ckeditor.core.editor.Editor;
import js.npm.ckeditor.utils.EmitterMixin.Emitter;
import js.npm.ckeditor.utils.ObservableMixin.Observable;

/** The base class for CKEditor commands. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/command.js", "default")
extern class Command implements Observable {

	/** The editor instance. **/
	final editor: Editor;

	/** Value indicating whether this command is enabled or disabled. **/
	var isEnabled: Bool;

	/** Creates a new command. **/
	function new(editor: Editor);

	/** Binds observable properties to other objects implementing the `Observable` interface. **/
	function bind(properties: Rest<String>): {
		to: Rest<EitherType<String, EitherType<Observable, Function>>> -> Void,
		toMany: (Array<Observable>, String, Function) -> Void
	};

	/** Destroys this command. **/
	function destroy(): Void;

	/** Registers a callback function to be executed when an event is fired in a specific (emitter) object. **/
	function listenTo(emitter: Emitter, event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;

	/** Registers a callback function to be executed when an event is fired. **/
	function on(event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;

	/** Refreshes this command. **/
	function refresh(): Void;

	/** Creates and sets the value of an observable property. **/
	function set(name: EitherType<String, DynamicAccess<Any>>, ?value: Any): Void;
}
