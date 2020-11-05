package js.npm.ckeditor.ui;

import js.npm.ckeditor.utils.EmitterMixin.Emitter;
import js.npm.ckeditor.utils.ObservableMixin.Observable;
import js.npm.ckeditor.utils.Locale;

/** The basic view class, which represents an HTML element created out of a template. **/
@:jsRequire("@ckeditor/ckeditor5-ui/src/view.js", "default")
extern class View implements Observable {

	/** Creates a new view. **/
	function new(?locale: Locale);

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
