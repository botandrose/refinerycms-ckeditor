// Copy this file into your project and configure the editor from here
CKEDITOR.editorConfig = function( config ) {
  config.extraPlugins = "cells"
  config.forcePasteAsPlainText = true
  config.contentsCss = "/assets/ckeditor.css"
  config.toolbar_Full = [
    { name: 'document',   items : [ 'Source','-','Save','Preview' ] },
    { name: 'editing',    items : [ 'SpellChecker' ] },
    { name: 'basicstyles',  items : [ 'Bold','Italic','RemoveFormat' ] },
    { name: 'styles',   items : [ 'Styles','Format','FontSize', 'SpecialChar' ] },
    '/',
    { name: 'paragraph',  items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
    { name: 'links',    items : [ 'Link','Unlink','Anchor' ] },
    { name: 'insert',   items : [ 'Image', 'Table','HorizontalRule', 'Cells' ] },
  ];

  config.format_tags = 'p;h1;h2;h3;h4';
  config.format_p = { element : 'p' };
  config.format_h1 = { element : 'h1' };
  config.format_h2 = { element : 'h2' };
  config.format_h3 = { element : 'h3' };
  config.format_h4 = { element : 'h4' };

  config.fontSize_sizes = 'Small/.9em;Normal/1em;Large/1.1em;XL/1.25em;XXL/1.5em;';
};

CKEDITOR.stylesSet.add( 'default',
  [
    // Block Styles
    { name : 'Blue Title'   , element : 'h3', styles : { 'color' : 'Blue' } },
    { name : 'Red Title'    , element : 'h3', styles : { 'color' : 'Red' } },

    // Inline Styles
    { name : 'Marker: Yellow' , element : 'span', styles : { 'background-color' : 'Yellow' } },
    { name : 'Marker: Green'  , element : 'span', styles : { 'background-color' : 'Lime' } },

    // Object Styles
    {
      name : 'Image on Left',
      element : 'img',
      attributes :
      {
        'style' : 'padding: 5px; margin-right: 5px',
        'border' : '2',
        'align' : 'left'
      }
    }
  ]
);
