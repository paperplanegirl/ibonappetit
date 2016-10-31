class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive:  false}
  validates :password, presence: true, on: :create #length: { in: 8..72},

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate,params[:password])
  end

end
