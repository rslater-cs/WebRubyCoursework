class ApplicationMailer < ActionMailer::Base
  default to: "info@postboard.com", from: 'info@postboard.com'
  layout 'mailer'
end
