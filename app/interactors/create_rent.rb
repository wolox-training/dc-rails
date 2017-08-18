class CreateRent
  include Interactor
  def call
    new_rent = Rent.new(user_id: context.user_id, book_id: context.book_id, from: context.from, to: context.to)

    if new_rent.save
      RentMailer.new_rent_notification(new_rent).deliver_later
      context.rent = new_rent
    else
      context.fail!(message: new_rent.errors.as_json)
    end
  end
end
