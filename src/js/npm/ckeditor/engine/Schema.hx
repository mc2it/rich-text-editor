package js.npm.ckeditor.engine;

import haxe.extern.EitherType;

/** The model's schema. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/schema.js", "default")
extern class Schema {

	/** Registers a schema item. **/
	function register(itemName: String, definition: SchemaItemDefinition): Void;
}

/** A definition of a `Schema` item. **/
typedef SchemaItemDefinition = {

	/** Defines allowed attributes of the given item. **/
	var ?allowAttributes: EitherType<String, Array<String>>;

	/** Inherits attributes from other items. **/
	var ?allowAttributesOf: EitherType<String, Array<String>>;

	/** Inherits "allowed children" from other items. **/
	var ?allowContentOf: EitherType<String, Array<String>>;

	/** Defines in which other items this item will be allowed. **/
	var ?allowIn: EitherType<String, Array<String>>;

	/** Inherits "allowed in" from other items. **/
	var ?allowWhere: EitherType<String, Array<String>>;

	/** A shorthand for `allowContentOf`, `allowWhere`, `allowAttributesOf` and `inheritTypesFrom`. **/
	var ?inheritAllFrom: String;

	/** Inherits `is*` properties of other items. **/
	var ?inheritTypesFrom: EitherType<String, Array<String>>;

	/** Value indicating whether this item is paragraph-like. **/
	var ?isBlock: Bool;

	/** Value indicating whether this item always finds its way to the editor data output regardless of the number and type of its descendants. **/
	var ?isContent: Bool;

	/** Value indicating whether this item is "text-like" and should be treated as an inline node. **/
	var ?isInline: Bool;

	/** Value indicating whether this item should not be split by `Enter`. **/
	var ?isLimit: Bool;

	/** Value indicating whether this item is "self-contained" and should be treated as a whole. **/
	var ?isObject: Bool;

	/** Value indicating whether this item should be selectable as a whole by the user. **/
	var ?isSelectable: Bool;
}
