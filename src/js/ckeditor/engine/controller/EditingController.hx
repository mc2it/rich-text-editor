package js.ckeditor.engine.controller;

import js.ckeditor.engine.conversion.Mapper;
import js.ckeditor.engine.view.View;

/** The controller for the editing pipeline. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/controller/editingcontroller.js", "default")
extern class EditingController {

	/** The mapper which describes the model-view binding. **/
	final mapper: Mapper;

	/** The editing view controller. **/
	final view: View;
}
