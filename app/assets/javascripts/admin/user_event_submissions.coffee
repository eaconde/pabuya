
$(window).load ->
  # TODO: trigger only on show page
  $("#user_event_submission_status").change (e) ->
    console.log "Triggered!"
    checked = $("#user_event_submission_status").val() == 'approved'
    $('div.user_event_submission_points').toggle(checked);
    $('div.user_event_submission_notes').toggle(!checked);
  $("#user_event_submission_status").change()

# jQuery ->
