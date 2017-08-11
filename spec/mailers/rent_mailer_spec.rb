require 'rails_helper'

RSpec.describe RentMailer, type: :mailer do
  let (:rent) { build(:rent) }

  describe 'new_rent_notification' do
    let(:mail) { RentMailer.new_rent_notification(rent) }

    it 'renders the headers' do
      expect(mail.subject).to eq( 'Success! You did it.' )
      expect(mail.to).to eq( [rent.user.email] )
    end
  end
end
