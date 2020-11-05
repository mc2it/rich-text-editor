package js.npm.ckeditor.engine.view;

import haxe.DynamicAccess;

/** A plain object that describes a view element in a way that a concrete, exact view element could be created from that description. **/
typedef ElementDefinition = EitherType<String, {

	/** The view element name. **/
	var name: String;

	/** An object with key-value pairs representing attributes. **/
	var ?attributes: DynamicAccess<String>;

	/** A class name or an array of class names to match. **/
	var ?classes: EitherType<String, Array<String>>;

	/** The element's priority. **/
	var ?priority: Int;

	/** An object with key-value pairs representing styles. **/
	var ?styles: DynamicAccess<String>;
}>;
