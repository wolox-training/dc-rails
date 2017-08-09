class OneBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genere, :description,
             :publisher, :year, :image_url

  def image_url
    object.image
  end
end
