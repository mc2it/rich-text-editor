package js.npm.ckeditor.utils;

/** Emitter/listener interface. **/
extern interface Emitter {

	/** Registers a callback function to be executed when an event is fired in a specific (emitter) object. **/
	function listenTo(emitter: Emitter, event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;

	/** Registers a callback function to be executed when an event is fired. **/
	function on(event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;
}
