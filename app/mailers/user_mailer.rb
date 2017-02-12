class UserMailer < ApplicationMailer
  def routes
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    Rails.application.routes.url_helpers
  end

  def submission_notification(submission)
    @submission = submission
    @user = submission.user
    # TODO: enable _url once front-end has been added
    @event_path = "http://localhost:3000/events/1"#routes.event_path(id: submission.event.id)
    @redeem_path = "http://localhost:3000/catalogs" #routes.redeem_path
    mail(to: @user.email, subject: 'Event Submission Received')
  end

  def redemption_notification(redemption)
    
  end
end
