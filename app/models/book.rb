class Book < ApplicationRecord
  belongs_to :author
  has_many :pictures, as: :imageable
end
