class BookSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :title, :created_at, :updated_at
  # model association
  belongs_to :author

  has_many :pictures, as: :imageable
end
