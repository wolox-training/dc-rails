class SuggestionSerializer < ActiveModel::Serializer
  attributes :title, :author, :link, :user

  has_one :user, serializer: UserSerializer
end
