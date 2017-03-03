CKEDITOR.plugins.add('formatpainter',
    {
        init: function (editor) {
            var flag = true;
            var styleString = '';

            editor.addCommand('insertFormatPainter',
                {
                    exec: function (editor) {
                        var selection = editor.getSelection();

                        if (flag) {
                            var parents = selection.getStartElement().getParents();

                            parents.forEach(function (node) {
                                if (node.getName() == 'span') {
                                    styleString += node.$.style.cssText.replace(/\"/g, '');
                                }
                            });

                            flag = false;
                        } else {
                            if (styleString.length == 0) {
                                styleString = 'font-family:times new roman,times,serif;font-size:16px;'
                            }

                            var selectedText = selection.getNative();
                            if (CKEDITOR.env.ie) {
                                selection.unlock(true);
                                selectedText = selection.getNative().createRange().text;
                            }
                            if (!selectedText.isCollapsed) {
                                editor.insertHtml('<span style="' + styleString + '">' + selectedText + '</span>');
                            }

                            styleString = '';
                            flag = true;
                        }
                    }
                });
            editor.ui.addButton('FormatPainter',
                {
                    label: 'FormatPainter',
                    command: 'insertFormatPainter',
                    icon: this.path + 'images/bitbug_favicon.ico'
                });
        }
    });