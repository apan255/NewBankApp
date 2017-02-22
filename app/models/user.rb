class User < ActiveRecord::Base
  has_secure_password

  has_many :accounts
  has_many :friends, :foreign_key => 'firend_id'

end
