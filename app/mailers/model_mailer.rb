class ModelMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_rent_notification(rent)
    @greeting = rent

    mail to: 'david.carrillo@wolox.com.ar', subject: 'Success! You did it.'
  end
end
