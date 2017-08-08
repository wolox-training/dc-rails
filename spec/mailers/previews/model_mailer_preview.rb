# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/new_record_notification
  def new_rent_notification
    ModelMailerMailer.new_rent_notification
  end
end
