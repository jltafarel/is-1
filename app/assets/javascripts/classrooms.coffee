# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#classroom_student_id, #classroom_course_id').select2()
  $('#classroom_entry_at').datetimepicker({
    locale: 'pt-br',
    sideBySide: true
  })

$(document).ready(ready)
$(document).on('page:load', ready)
