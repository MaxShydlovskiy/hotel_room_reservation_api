class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  validates_presence_of :password, :email
  validates_length_of :password, minimum: 4, on: :create
  has_many :rentals

  def admin?
    role == 'admin'
  end
end
