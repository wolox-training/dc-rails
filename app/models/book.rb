class Book < ApplicationRecord
  validates :genere, :author, :image, :title, :publisher, :year, presence: true

  has_many :rents, dependent: :delete_all

  def actual_rent
    rents.where(book_id: id).where('rents.from <= :current_date AND rents.to >= :current_date', current_date: Date.today).first
  end
end
