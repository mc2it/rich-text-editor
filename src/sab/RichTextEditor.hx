package sab;

import ckeditor.ClassicEditor;
import ckeditor.Plugin.Alignment;
import ckeditor.Plugin.Autoformat;
import ckeditor.Plugin.Bold;
import ckeditor.Plugin.Essentials;
import ckeditor.Plugin.FontBackgroundColor;
import ckeditor.Plugin.FontColor;
import ckeditor.Plugin.Heading;
import ckeditor.Plugin.HorizontalLine;
import ckeditor.Plugin.Image;
import ckeditor.Plugin.ImageCaption;
import ckeditor.Plugin.ImageResize;
import ckeditor.Plugin.ImageStyle;
import ckeditor.Plugin.ImageToolbar;
import ckeditor.Plugin.Italic;
import ckeditor.Plugin.Link;
import ckeditor.Plugin.List;
import ckeditor.Plugin.MediaEmbed;
import ckeditor.Plugin.MediaEmbedToolbar;
import ckeditor.Plugin.Paragraph;
import ckeditor.Plugin.PasteFromOffice;
import ckeditor.Plugin.Plugin;
import ckeditor.Plugin.RemoveFormat;
import ckeditor.Plugin.RemoveFormatLinks;
import ckeditor.Plugin.Strikethrough;
import ckeditor.Plugin.Table;
import ckeditor.Plugin.TableCellProperties;
import ckeditor.Plugin.TableProperties;
import ckeditor.Plugin.TableToolbar;
import ckeditor.Plugin.TextTransformation;
import ckeditor.Plugin.TodoList;
import ckeditor.Plugin.Underline;

/** An implementation of a rich text editor. */
@:expose class RichTextEditor extends ClassicEditor {

  /** The set of supported plug-ins. */
  static var builtinPlugins: Array<Class<Plugin>> = [
    Alignment,
    Autoformat,
    Bold, Italic, Strikethrough, Underline,
    Essentials,
    FontBackgroundColor, FontColor,
    Heading,
    HorizontalLine,
    Image, ImageCaption, ImageResize, ImageStyle, ImageToolbar,
    Link,
    List, TodoList,
    MediaEmbed, MediaEmbedToolbar,
    Paragraph,
    PasteFromOffice,
    RemoveFormat, RemoveFormatLinks,
    Table, TableCellProperties, TableProperties, TableToolbar,
    TextTransformation
  ];

  /** The default editor settings. */
  static var defaultConfig = {
    alignment: {
      options: ['left', 'center', 'right']
    },
    image: {
      resizeUnit: 'px',
      styles: ['full', 'alignLeft', 'alignCenter', 'alignRight'],
      toolbar: ['imageStyle:full', 'imageStyle:alignLeft', 'imageStyle:alignCenter', 'imageStyle:alignRight']
    },
    language: 'fr',
    table: {
      contentToolbar: [
        'tableColumn', 'tableRow', 'mergeTableCells',
        'tableProperties', 'tableCellProperties'
      ]
    },
    toolbar: [
      'heading', '|',
      'bold', 'italic', 'underline', 'strikethrough', 'link', '|',
      'fontColor', 'fontBackgroundColor', '|',
      'removeFormat', '|',
      'undo', 'redo', '|',
      'bulletedList', 'numberedList', 'todoList', '|',
      'alignment:left', 'alignment:center', 'alignment:right', '|',
      'horizontalLine', 'insertTable', 'mediaEmbed'
    ],
    typing: {
      transformations: {
        remove: ['quotes']
      }
    }
  };
}
