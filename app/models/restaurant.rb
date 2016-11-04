class Restaurant < ApplicationRecord
  has_many  :reservations
  has_many    :bookmarks

end
