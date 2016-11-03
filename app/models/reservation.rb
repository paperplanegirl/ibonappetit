class Reservation < ApplicationRecord
  # belongs_to  :users
  has_and_belongs_to_many :users
  belongs_to  :restaurant
end
