package ckeditor.engine.view;

/** A plain object that describes a view element in a way that a concrete, exact view element could be created from that description. **/
typedef ElementDefinition = EitherType<String, {

	/** The view element name. **/
	name: String,

	/** An object with key-value pairs representing attributes. **/
	?attributes: DynamicAccess<String>,

	/** A class name or an array of class names to match. **/
	?classes: EitherType<String, Array<String>>,

	/** The element's priority. **/
	?priority: Int,

	/** An object with key-value pairs representing styles. **/
	?styles: DynamicAccess<String>
}>;
