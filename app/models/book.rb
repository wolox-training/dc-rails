class Book < ApplicationRecord
  validates :genere, :author, :image, :title, :publisher, :year, presence: true

  has_many :rents
end