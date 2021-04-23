package js.npm.ckeditor.engine.conversion;

import js.npm.ckeditor.utils.EmitterMixin.Emitter;

/** Maps elements, positions and markers between the view and the model. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/conversion/mapper.js", "default")
extern class Mapper implements Emitter {

	/** Registers a callback function to be executed when an event is fired in a specific (emitter) object. **/
	function listenTo(emitter: Emitter, event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;

	/** Registers a callback function to be executed when an event is fired. **/
	function on(event: String, callback: Function, ?options: {priority: EitherType<Int, String>}): Void;
}
