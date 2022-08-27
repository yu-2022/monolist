class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :items, through: :tag_maps
end
