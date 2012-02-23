$ ->
  $("textarea.wysiwyg").each ->
    CKEDITOR.replace this,
      width: $(this).width()
      height: $(this).height()
      bodyClass: $(this).data "body-class"
      contentsCss: "/assets/ckeditor.css"
      customConfig: "/assets/ckeditor.js"

$(window).load ->
  $(".box_of_holding").each ->
    $img = $(this).find("img")
    image_width = $img.width()
    image_height = $img.height()

    $this = $(this)
    box_width = $this.width()
    box_height = $this.height()

    this.scrollLeft = (image_width - box_width) / 2
    this.scrollTop = (image_height - box_height) / 2

$ ->
  $(".rightbar").tabs()

window.submit_and_continue = (e, redirect_to) ->
  for key, instance of CKEDITOR.instances
    CKEDITOR.instances[key].updateElement()

  $('#continue_editing').val(true)
  $('#flash').fadeOut(250)

  $('.fieldWithErrors').removeClass('fieldWithErrors').addClass('field')
  $('#flash_container .errorExplanation').remove()

  $.post $('#continue_editing').get(0).form.action, $($('#continue_editing').get(0).form).serialize(), (data) ->
    if ($flash_container = $('#flash_container')).length > 0
      $flash_container.html(data)

      $('#flash').css({
        'width': 'auto',
        'visibility': null
      }).fadeIn(550)

      $('.errorExplanation').not($('#flash_container .errorExplanation')).remove()

      error_fields = $('#fieldsWithErrors').val()
      if error_fields?
        $.each error_fields.split(','), ->
          $("#" + this).wrap("<div class='fieldWithErrors' />")

      else if redirect_to?
        window.location = redirect_to

      $('.fieldWithErrors:first :input:first').focus()

      $('#continue_editing').val(false)

      init_flash_messages()

  e.preventDefault()
