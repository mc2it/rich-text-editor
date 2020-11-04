package js.npm.ckeditor.engine.controller;

import js.npm.ckeditor.engine.conversion.Mapper;

/** Controller for the editing pipeline. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/controller/editingcontroller.js", "default")
extern class EditingController {

	/** The mapper which describes the model-view binding. **/
	final mapper: Mapper;
}
