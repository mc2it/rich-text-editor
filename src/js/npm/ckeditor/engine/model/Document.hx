package js.npm.ckeditor.engine.model;

/** The data model's document. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/document.js", "default")
extern class Document {

	/** The selection in this document. **/
	final selection: DocumentSelection;
}
