class ExternalBook < ApplicationRecord
  validates :data, :isbn, :worker_id, presence: true

end
