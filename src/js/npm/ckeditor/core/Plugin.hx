package js.npm.ckeditor.core;

import haxe.DynamicAccess;
import js.npm.ckeditor.core.editor.Editor;
import js.npm.ckeditor.utils.EmitterMixin.Emitter;
import js.npm.ckeditor.utils.ObservableMixin.Observable;

/** The base class for CKEditor plugins. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/plugin.js", "default")
extern class Plugin implements Observable {

	/** The editor instance. **/
	final editor: Editor;

	/** Binds observable properties to other objects implementing the `Observable` interface. **/
	function bind(properties: Rest<String>): {
		to: Rest<EitherType<String, EitherType<Observable, Function>>> -> Void,
		toMany: (Array<Observable>, String, Function) -> Void
	};

	/** Registers a callback function to be executed when an event is fired in a specific (emitter) object. **/
	function listenTo(emitter: Emitter, event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;

	/** Registers a callback function to be executed when an event is fired. **/
	function on(event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;

	/** Creates and sets the value of an observable property. **/
	function set(name: EitherType<String, DynamicAccess<Any>>, ?value: Any): Void;
}
