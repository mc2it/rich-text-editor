package js.npm.ckeditor.engine.conversion;

import haxe.Constraints.Function;

/** Maps elements, positions and markers between the view and the model. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/conversion/mapper.js", "default")
extern class Mapper {

	/** Registers a callback function to be executed when an event is fired. **/
	function on(event: String, callback: Function, ?options: {priority: Int}): Void;
}
