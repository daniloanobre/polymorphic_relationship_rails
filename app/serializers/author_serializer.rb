class AuthorSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :created_at, :updated_at
  # model association
  has_many :books

  has_many :pictures, as: :imageable
end
