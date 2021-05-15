package js.ckeditor.engine.view;

/** A view matcher. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/view/matcher.js", "default")
extern class Matcher {}

/** An entity that is a valid pattern recognized by a matcher. **/
typedef MatcherPattern = EitherType<String, EitherType<EReg, {

	/** The view element name to match. **/
	var name: EitherType<String, EReg>;

	/** An object with key-value pairs representing attributes. **/
	var ?attributes: DynamicAccess<EitherType<String, EReg>>;

	/** A class name or an array of class names to match. **/
	var ?classes: EitherType<String, EitherType<EReg, Array<EitherType<String, EReg>>>>;

	/** An object with key-value pairs representing styles. **/
	var ?styles: DynamicAccess<EitherType<String, EReg>>;
}>>;
