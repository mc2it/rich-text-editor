import Alignment from '@ckeditor/ckeditor5-alignment/src/alignment';
import Autoformat from '@ckeditor/ckeditor5-autoformat/src/autoformat';
import Bold from '@ckeditor/ckeditor5-basic-styles/src/bold';
import Italic from '@ckeditor/ckeditor5-basic-styles/src/italic';
import Strikethrough from '@ckeditor/ckeditor5-basic-styles/src/strikethrough';
import Underline from '@ckeditor/ckeditor5-basic-styles/src/underline';
import Plugin from '@ckeditor/ckeditor5-core/src/plugin';
import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor';
import Essentials from '@ckeditor/ckeditor5-essentials/src/essentials';
import FontBackgroundColor from '@ckeditor/ckeditor5-font/src/fontbackgroundcolor';
import FontColor from '@ckeditor/ckeditor5-font/src/fontcolor';
import Heading from '@ckeditor/ckeditor5-heading/src/heading';
import Image from '@ckeditor/ckeditor5-image/src/image';
import ImageCaption from '@ckeditor/ckeditor5-image/src/imagecaption';
import ImageStyle from '@ckeditor/ckeditor5-image/src/imagestyle';
import ImageToolbar from '@ckeditor/ckeditor5-image/src/imagetoolbar';
import Link from '@ckeditor/ckeditor5-link/src/link';
import List from '@ckeditor/ckeditor5-list/src/list';
import MediaEmbed from '@ckeditor/ckeditor5-media-embed/src/mediaembed';
import MediaEmbedToolbar from '@ckeditor/ckeditor5-media-embed/src/mediaembedtoolbar';
import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph';
import PasteFromOffice from '@ckeditor/ckeditor5-paste-from-office/src/pastefromoffice';
import RemoveFormat from '@ckeditor/ckeditor5-remove-format/src/removeformat';
import RemoveFormatLinks from '@ckeditor/ckeditor5-remove-format/src/removeformatui';
import Table from '@ckeditor/ckeditor5-table/src/table';
import TableToolbar from '@ckeditor/ckeditor5-table/src/tabletoolbar';

/** An implementation of a rich text editor. */
export class RichTextEditor extends ClassicEditor {

  /** The set of supported plug-ins. */
  static readonly builtinPlugins: Plugin[] = [
    Alignment,
    Autoformat,
    Bold, Italic, Strikethrough, Underline,
    Essentials,
    FontBackgroundColor, FontColor,
    Heading,
    Image, ImageCaption, ImageStyle, ImageToolbar,
    Link,
    List,
    MediaEmbed, MediaEmbedToolbar,
    Paragraph,
    PasteFromOffice,
    RemoveFormat, RemoveFormatLinks,
    Table, TableToolbar
  ];

  /** The default editor settings. */
  static readonly defaultConfig: Record<string, any> = {
    alignment: {
      options: ['left', 'center', 'right']
    },
    image: {
      styles: ['full', 'alignLeft', 'alignCenter', 'alignRight'],
      toolbar: ['imageStyle:full', 'imageStyle:alignLeft', 'imageStyle:alignCenter', 'imageStyle:alignRight']
    },
    language: 'fr',
    table: {
      contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells']
    },
    toolbar: [
      'heading', '|',
      'bold', 'italic', 'underline', 'strikethrough', 'link', '|',
      'fontColor', 'fontBackgroundColor', '|',
      'removeFormat', '|',
      'undo', 'redo', '|',
      'bulletedList', 'numberedList', '|',
      'alignment:left', 'alignment:center', 'alignment:right', '|',
      'insertTable', 'mediaEmbed'
    ]
  };
}
