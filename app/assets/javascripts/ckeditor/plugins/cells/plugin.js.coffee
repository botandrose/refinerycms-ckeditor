CKEDITOR.plugins.add "cells",
  init: (editor) ->
    editor.addCommand "configureCellDialog", new CKEDITOR.dialogCommand "configureCellDialog"
    editor.ui.addButton "Cells",
      label: "Insert/Edit Cell"
      command: "configureCellDialog"
      icon: this.path + "images/cells.gif"

    CKEDITOR.dialog.add "configureCellDialog", (editor) ->
      cellsOptions = ->
        response = $.ajax
          type: 'GET',
          url: "/refinery/ckeditor/cells.js"
          dataType: 'json',
          async: false
        options = JSON.parse response.responseText
        options.unshift [" --- Select a cell --- ", ""]
        options

      title : "Cell Properties"
      minWidth : 400
      minHeight : 200

      onOk : ->
        data = {}
        this.commitContent data
        if data.cell != ""
          cell = editor.document.createElement 'cell'
          cell.setAttribute 'name', data.cell
          cell.setAttribute 'class', data.cell.replace(/[^a-z0-9]+/g, "-")
          editor.insertElement cell

      contents : [
        id: 'general'
        label : 'Settings'
        elements : [
          {
            type : 'html'
            html : "Add bits of dynamic functionality into your page."
          },
          {
            type : 'select',
            id : 'cell',
            label : 'Cell',
            items : cellsOptions()
            commit : (data) ->
              data.cell = this.getValue()
          }
        ]
      ]
