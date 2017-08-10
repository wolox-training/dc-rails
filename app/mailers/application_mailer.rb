class ApplicationMailer < ActionMailer::Base
  mail_from = Rails.application.secrets.default_mail_from
  default from: mail_from
  layout 'mailer'
end
