package mc2it_rte.timestamp;

import js.npm.ckeditor.core.Plugin;
import js.npm.ckeditor.core.editor.EditorWithUI;
import js.npm.ckeditor.ui.button.ButtonView;
import js.npm.ckeditor.utils.TranslationService;

/** The user interface layer of the timestamp plugin. **/
@:keep class TimestampUI extends Plugin {

	/** Initializes this plugin. **/
	public function init() {
		TranslationService.add("fr", {Timestamp: "Horodatage"});
		(cast editor: EditorWithUI).ui.componentFactory.add("timestamp", locale -> {
			final buttonView = new ButtonView(locale);
			buttonView.bind("isEnabled").to(editor.commands.get("timestamp"));
			buttonView.set({
				icon: '<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200zm61.8-104.4l-84.9-61.7c-3.1-2.3-4.9-5.9-4.9-9.7V116c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v141.7l66.8 48.6c5.4 3.9 6.5 11.4 2.6 16.8L334.6 349c-3.9 5.3-11.4 6.5-16.8 2.6z"/></svg>',
				label: editor.t("Timestamp"),
				tooltip: true
			});

			listenTo(buttonView, "execute", () -> {
				editor.execute("timestamp");
				editor.editing.view.focus();
			});

			return buttonView;
		});
	}
}
