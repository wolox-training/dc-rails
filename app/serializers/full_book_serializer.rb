class FullBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genere, :description, :publisher, :year, :image_url, :actual_rent

  has_one :actual_rent

  def image_url
    object.image
  end
end
