# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = () ->

  $('.checklist').on 'click', ->
    checkbox = $(this).find("input[type='checkbox']")
    checked = checkbox.prop('checked')
    checkbox.prop('checked', !checked)

$(document).ready(ready)
$(document).on('page:load', ready)

