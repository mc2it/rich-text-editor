package js.npm.ckeditor.utils;

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
}
