class Book < ApplicationRecord::Base
  validates :genere, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
end
