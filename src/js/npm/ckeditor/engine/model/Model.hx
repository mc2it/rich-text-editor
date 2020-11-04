package js.npm.ckeditor.engine.model;

/** The editor's data model. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/model.js", "default")
extern class Model {

	/** The model's document. **/
	final document: Document;

	/** The model's schema. **/
	final schema: Schema;
}
