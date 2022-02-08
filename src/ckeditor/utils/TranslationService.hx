package ckeditor.utils;

/** The internationalization message interface. **/
typedef Message = {

	/** The message string to translate. **/
	string: String,

	/** The message identifier. **/
	?id: String,

	/** The plural form of the message. **/
	?plural: String
}

/** A set of helper functions for translation. **/
@:jsRequire("@ckeditor/ckeditor5-utils/src/translation-service.js")
extern class TranslationService {

	/** Adds translations to existing ones or overrides the existing translations. **/
	static function add(language: String, translations: DynamicAccess<EitherType<String, Array<String>>>, ?getPluralForm: Int -> Int): Void;
}
