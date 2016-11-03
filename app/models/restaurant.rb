class Restaurant < ApplicationRecord
  # belongs_to  :user
  has_many  :reservations
  has_many    :bookmarks

end
