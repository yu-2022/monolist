class List < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :privacy
  
  belongs_to :user

  validates :list_name,  presence: true
  validates :privacy_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :user,       presence: true

end
