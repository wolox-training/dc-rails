class Book < ApplicationRecord
  validates :genere, :author, :image, :title, :publisher, :year, presence: true

  has_many :rents, dependent: :delete_all

  def actual_rent
    rents.where(book_id: id)
         .find_by('rents.from <= :current_date AND rents.to >= :current_date',
                  current_date: Time.zone.today)
  end
end
