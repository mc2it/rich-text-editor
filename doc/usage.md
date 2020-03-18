path: blob/master
source: src/editor.ts

# Usage
This package supplies a single class, `RichTextEditor`, which is a custom build of the [CKEditor](https://ckeditor.com/ckeditor-5)'s classic editor. It extends from the [`ClassicEditor`](https://ckeditor.com/docs/ckeditor5/latest/api/module_editor-classic_classiceditor-ClassicEditor.html) class provided by this project, so its usage is basically the same.

In your HTML page, add an element that **SAB Rich Text Editor** should make editable:

```html
<textarea id="editor"></textarea>
```

Then call the `RichTextEditor.create()` method:

```html
<script>
  RichTextEditor
    .create(document.querySelector('#editor'))
    .catch(console.error);
</script>
```

This code snippet will turn the `<textarea id="editor">` into a rich text editor.

## Features
- [Autoformatting](https://ckeditor.com/docs/ckeditor5/latest/features/autoformat.html)
- [Automatic text transformation](https://ckeditor.com/docs/ckeditor5/latest/features/text-transformation.html)
- [Basic text styles](https://ckeditor.com/docs/ckeditor5/latest/features/basic-styles.html): `Bold`, `Italic`, `Strikethrough` and `Underline`.
- [Font](https://ckeditor.com/docs/ckeditor5/latest/features/font.html): `FontColor` and `FontBackgroundColor`.
- [Headings](https://ckeditor.com/docs/ckeditor5/latest/features/headings.html)
- [Horizontal line](https://ckeditor.com/docs/ckeditor5/latest/features/horizontal-line.html)
- [Images](https://ckeditor.com/docs/ckeditor5/latest/features/image.html): `Image`, `ImageCaption`, `ImageResize`, `ImageStyle` and `ImageToolbar`.
- [Link](https://ckeditor.com/docs/ckeditor5/latest/features/link.html)
- [Media embed](https://ckeditor.com/docs/ckeditor5/latest/features/media-embed.html): `MediaEmbed` and `MediaEmbedToolbar`.
- [Paste from Office](https://ckeditor.com/docs/ckeditor5/latest/features/pasting/paste-from-word.html)
- [Remove format](https://ckeditor.com/docs/ckeditor5/latest/features/remove-format.html)
- [Tables](https://ckeditor.com/docs/ckeditor5/latest/features/table.html): `Table`, `TableCellProperties`, `TableProperties` and `TableToolbar`.
- [Text alignment](https://ckeditor.com/docs/ckeditor5/latest/features/text-alignment.html)
- [To-do lists](https://ckeditor.com/docs/ckeditor5/latest/features/todo-lists.html)
- and more...

## Localization
By default, the editor will display in **French**. This is the language built into the `editor.js` file.

In order to change the language of the editor UI, you need to load additional language file(s).
These files are located in the `build/i18n` folder of this package.

```html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/i18n/[lang].js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/i18n/[lang].js"></script>

<!-- SAB International -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/i18n/[lang].js"></script>
```

For example:

```html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/editor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/i18n/en.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/editor.js"></script>
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/i18n/en.js"></script>

<!-- SAB International -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/editor.js"></script>
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/i18n/en.js"></script>
```

Next, you can configure the editor to use one of the loaded language:

```html
<script>
  RichTextEditor
    .create(document.querySelector('#editor'), {language: 'en'})
    .catch(error => console.error(error));
</script>
```

## Advanced usage
For other uses and detailed instructions, you should look at the [official CKEditor documentation](https://ckeditor.com/docs/ckeditor5/latest).
