// @ts-ignore
import Alignment from '@ckeditor/ckeditor5-alignment/src/alignment';
// @ts-ignore
import Autoformat from '@ckeditor/ckeditor5-autoformat/src/autoformat';
// @ts-ignore
import Bold from '@ckeditor/ckeditor5-basic-styles/src/bold';
// @ts-ignore
import Italic from '@ckeditor/ckeditor5-basic-styles/src/italic';
// @ts-ignore
import Strikethrough from '@ckeditor/ckeditor5-basic-styles/src/strikethrough';
// @ts-ignore
import Underline from '@ckeditor/ckeditor5-basic-styles/src/underline';
// @ts-ignore
import Plugin from '@ckeditor/ckeditor5-core/src/plugin';
// @ts-ignore
import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor';
// @ts-ignore
import Essentials from '@ckeditor/ckeditor5-essentials/src/essentials';
// @ts-ignore
import FontBackgroundColor from '@ckeditor/ckeditor5-font/src/fontbackgroundcolor';
// @ts-ignore
import FontColor from '@ckeditor/ckeditor5-font/src/fontcolor';
// @ts-ignore
import Heading from '@ckeditor/ckeditor5-heading/src/heading';
// @ts-ignore
import Image from '@ckeditor/ckeditor5-image/src/image';
// @ts-ignore
import ImageCaption from '@ckeditor/ckeditor5-image/src/imagecaption';
// @ts-ignore
import ImageStyle from '@ckeditor/ckeditor5-image/src/imagestyle';
// @ts-ignore
import ImageToolbar from '@ckeditor/ckeditor5-image/src/imagetoolbar';
// @ts-ignore
import Link from '@ckeditor/ckeditor5-link/src/link';
// @ts-ignore
import List from '@ckeditor/ckeditor5-list/src/list';
// @ts-ignore
import MediaEmbed from '@ckeditor/ckeditor5-media-embed/src/mediaembed';
// @ts-ignore
import MediaEmbedToolbar from '@ckeditor/ckeditor5-media-embed/src/mediaembedtoolbar';
// @ts-ignore
import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph';
// @ts-ignore
import PasteFromOffice from '@ckeditor/ckeditor5-paste-from-office/src/pastefromoffice';
// @ts-ignore
import Table from '@ckeditor/ckeditor5-table/src/table';
// @ts-ignore
import TableToolbar from '@ckeditor/ckeditor5-table/src/tabletoolbar';

import {JsonMap} from './map';

/** An implementation of a rich text editor. */
export class RichTextEditor extends ClassicEditor {

  /** The set of supported plug-ins. */
  static readonly builtinPlugins: Plugin[] = [
    Alignment,
    Autoformat,
    Bold, Italic, Strikethrough, Underline,
    Essentials, // Includes: Clipboard, Enter, ShiftEnter, Typing and Undo.
    FontBackgroundColor, FontColor,
    Heading,
    Image, ImageCaption, ImageStyle, ImageToolbar,
    Link,
    List,
    MediaEmbed, MediaEmbedToolbar,
    Paragraph,
    PasteFromOffice,
    Table, TableToolbar
  ];

  /** The default editor settings. */
  static readonly defaultConfig: JsonMap = {
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
      'undo', 'redo', '|',
      'bulletedList', 'numberedList', '|',
      'alignment:left', 'alignment:center', 'alignment:right', '|',
      'insertTable', 'mediaEmbed'
    ]
  };
}
