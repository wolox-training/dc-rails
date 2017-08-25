class CreateRent
  include Interactor
  def call
    new_rent = rent
    if new_rent.save
      RentMailer.new_rent_notification(new_rent).deliver_later
      context.rent = new_rent
    else
      context.fail!(message: new_rent.errors.as_json)
    end
  end

  private

  def rent
    Rent.new(context.params)
  end
end
