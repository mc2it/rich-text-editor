package ckeditor.engine.model;

/** A special selection which is used as the document's selection. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/documentselection.js", "default")
extern class DocumentSelection {

	/** The selection focus. **/
	final focus: Position;
}
