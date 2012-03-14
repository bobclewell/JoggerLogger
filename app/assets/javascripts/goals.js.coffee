# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  
  $('#goal_form').hide()
  $('#goal_form h2').hide()
  
  $('.goal_type').click ->
    $('#goal_selection').slideUp('slow')
    $('#goal_form').slideDown('slow')

  $('#back').click ->
    $('#goal_form').slideUp('slow')
    $('#goal_selection').slideDown('slow')
    $('#goal_form h2').hide()
    $('#goal_goal_type').val('')
    $('#goal_time_unit').val('')

  $('.single_distance').click ->
    $('.all').show()
    $('.distance').show()
    $('.time').hide()
    $('#goal_form .single_distance').show()
    $('#goal_goal_type').val('1')

  $('.single_total_time').click ->
    $('.all').show()
    $('.distance').hide()
    $('.time').show()
    $('#goal_form .single_total_time').show()
    $('#goal_goal_type').val('2')
    $('#goal_time_unit').val('seconds')

  $('.single_distance_in_time').click ->
    $('.all').show()
    $('.distance').show()
    $('.time').show()
    $('#goal_form .single_distance_in_time').show()
    $('#goal_goal_type').val('3')
    $('#goal_time_unit').val('seconds')

  $('.single_distance_at_a_pace').click ->
    $('.all').show()
    $('.distance').show()
    $('.time').show()
    $('#goal_form .single_distance_at_a_pace').show()
    $('#goal_goal_type').val('4')
    $('#goal_time_unit').val('seconds')

  $('.multi_distance').click ->
    $('.all').show()
    $('.distance').show()
    $('.time').hide()
    $('#goal_form .multi_distance').show()
    $('#goal_goal_type').val('5')

  $('.multi_distance_in_time').click ->
    $('.all').show()
    $('.distance').show()
    $('.time').show()
    $('#goal_form .multi_distance_in_time').show()
    $('#goal_goal_type').val('6')
    $('#goal_time_unit').val('days')
