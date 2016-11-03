class User < ApplicationRecord

  has_and_belongs_to_many :reservations, dependent: :destroy

  has_many  :bookmarks, dependent: :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive:  false}
  validates :password, presence: true, on: :create #length: { in: 8..72},

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate,params[:password])
  end

end
