# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#new_post_comment")
    .bind 'ajax:complete', (event, data, status) ->
      $('#post-comments legend .comments_list').append(data.responseText)
      $('#new_post_comment').find('input:text, input:password, input:file, select, textarea').val('')
