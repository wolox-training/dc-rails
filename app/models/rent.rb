class Rent < ApplicationRecord
  validates :user_id, :book_id, :from, :to, presence: true
  belongs_to :user
  belongs_to :book
end
