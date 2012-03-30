require "refinery/ckeditor/cell_processor"

Rails.configuration.middleware.use Refinery::CKEditor::CellProcessor
