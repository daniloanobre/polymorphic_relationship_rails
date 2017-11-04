class PictureSerializer < ActiveModel::Serializer
  attributes :id, :path, :imageable_type
end
