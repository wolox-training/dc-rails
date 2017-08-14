class Suggestion < ApplicationRecord
  validates :author, :link, :title, :publisher, :year, :editorial, presence: true

  belongs_to :user
end
