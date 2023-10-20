class Contact < ApplicationRecord
  belongs_to :user
  has_one_attached :recto_id
  has_one_attached :verso_id
  has_one_attached :receipt
end
