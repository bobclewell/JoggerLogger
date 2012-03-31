jQuery ->
  
  $('#goal_form').hide()
  $('#goal_form h2').hide()
  
  $('.goal_type').click ->
    $('#goal_selection').fadeOut(500)
    $('#goal_form').delay(500).fadeIn()

  $('#back').click ->
    $('#goal_form').fadeOut(500)
    $('#goal_selection').delay(500).fadeIn()
    $('#goal_form h2').fadeOut(500)
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
