package ckeditor.engine.model;

/** Represents a part of a text node. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/textproxy.js", "default")
extern class TextProxy {

	/** Gets an attribute value for the given `key`. **/
	function getAttribute(key: String): Dynamic;

	/** Checks if this text proxy has an attribute with the given `key`. **/
	function hasAttribute(key: String): Bool;
}
