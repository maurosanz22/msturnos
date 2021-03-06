# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  loaded_activity = $('#activity_id :selected').text()
  activities = $('#activity_id').html()
  $('#activity_id').parent().hide()
  if loaded_activity.length != 0
   branch = $('#activity_branch_id :selected').text()
   escaped_branch = branch.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
   options = $(activities).filter("optgroup[label=#{escaped_branch}]").html()
   $('#activity_id').html(options)
   $('#activity_id').parent().show()
  $('#activity_branch_id').change ->
    branch = $('#activity_branch_id :selected').text()
    escaped_branch = branch.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    console.log(escaped_branch)
    console.log(branch)
    options = $(activities).filter("optgroup[label='#{escaped_branch}']").html()
    if options
      $('#activity_id').html(options)
      $('#activity_id').parent().show()
    else
      $('#activity_id').empty()
