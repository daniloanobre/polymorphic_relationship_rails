class Author < ApplicationRecord
  has_many :books
  has_many :pictures, as: :imageable
end
