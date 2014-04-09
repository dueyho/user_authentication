class User < ActiveRecord::Base
  has_secure_password
  has_one :profile

  validates_uniqueness_of :email
end
