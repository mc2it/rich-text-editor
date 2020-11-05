package js.npm.ckeditor.engine.controller;

import js.npm.ckeditor.engine.conversion.Mapper;
import js.npm.ckeditor.engine.view.View;

/** Controller for the editing pipeline. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/controller/editingcontroller.js", "default")
extern class EditingController {

	/** The mapper which describes the model-view binding. **/
	final mapper: Mapper;

	/** The editing view controller. **/
	final view: View;
}
