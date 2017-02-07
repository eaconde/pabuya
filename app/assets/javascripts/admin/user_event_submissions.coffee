init_submissions = ->
  $("#user_event_submission_status").change (e) ->
    checked = $("#user_event_submission_status").val() == 'approved'
    $('div.user_event_submission_points').toggle(checked);
    $('div.user_event_submission_notes').toggle(!checked);
  $("#user_event_submission_status").change()

jQuery ->
  # https://github.com/turbolinks/turbolinks/issues/9
  document.addEventListener 'turbolinks:load', ->
    run_ontag 'user_event_submissions', ->
      init_submissions()
    return
