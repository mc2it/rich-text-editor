package js.npm.ckeditor.utils;

import js.npm.ckeditor.utils.TranslationService.Message;

/** The widget plugin. **/
@:jsRequire("@ckeditor/ckeditor5-utils/src/locale.js", "default")
extern class Locale {

	/** The editor content language code in the ISO 639-1 format. **/
	final contentLanguage: String;

	/** The text direction of the editor content language. **/
	final contentLanguageDirection: String;

	/** The editor UI language code in the ISO 639-1 format. **/
	final uiLanguage: String;

	/** The text direction of the editor UI language. **/
	final uiLanguageDirection: String;

	/** Translates the given message to the UI language. **/
	function t(message: EitherType<String, Message>, ?values: EitherType<String, EitherType<Float, EitherType<Int, Array<EitherType<String, EitherType<Float, Int>>>>>>): String;
}
