class SupportRequestMailer < ApplicationMailer
  def respond(support_request)
    @support_request = support_request
    recipient_email = @support_request&.email || 'default@example.com'
    mail(
      to: recipient_email,
      subject: "Answer of your support request #{@support_request.title}"
    )
  end
end
