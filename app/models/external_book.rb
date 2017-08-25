class ExternalBook < ApplicationRecord
  validates :data, :isbn, presence: true
end
