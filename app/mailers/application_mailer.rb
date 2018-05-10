class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAILGUN_EMAIL')
  layout 'mailer'
end
