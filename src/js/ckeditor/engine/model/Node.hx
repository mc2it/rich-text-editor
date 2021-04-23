package js.npm.ckeditor.engine.model;

/** A model node. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/node.js", "default")
extern class Node {

	/** Gets an attribute value for the given `key`. **/
	function getAttribute(key: String): Dynamic;

	/** Checks if this node has an attribute with the given `key`. **/
	function hasAttribute(key: String): Bool;
}
