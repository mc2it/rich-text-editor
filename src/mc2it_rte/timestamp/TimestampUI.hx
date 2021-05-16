package mc2it_rte.timestamp;

import js.ckeditor.core.Plugin;
import js.ckeditor.core.editor.EditorWithUI;
import js.ckeditor.ui.button.ButtonView;
import js.ckeditor.utils.TranslationService;

/** The user interface layer of the timestamp plugin. **/
@:keep class TimestampUI extends Plugin {

	/** Initializes this plugin. **/
	public function init() {
		TranslationService.add("de", {"Timestamp": "Zeitstempel"});
		TranslationService.add("es", {"Timestamp": "Marca de tiempo"});
		TranslationService.add("fr", {"Timestamp": "Horodatage"});

		(cast editor: EditorWithUI).ui.componentFactory.add("timestamp", locale -> {
			final buttonView = new ButtonView(locale);
			buttonView.bind("isEnabled").to(editor.commands.get("timestamp"));
			buttonView.set({
				icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/><path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/></svg>',
				label: editor.t("Timestamp"),
				tooltip: true
			});

			listenTo(buttonView, "execute", () -> {
				editor.execute("timestamp");
				editor.focus();
			});

			buttonView;
		});
	}
}
