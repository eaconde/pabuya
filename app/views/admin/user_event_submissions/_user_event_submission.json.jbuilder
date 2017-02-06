json.extract! user_event_submission, :id, :user_id, :event_id, :created_at, :updated_at
json.url user_event_submission_url(user_event_submission, format: :json)