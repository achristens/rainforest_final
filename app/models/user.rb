class User < ApplicationRecord
# One of the things this method does it validate that a password exist, so we don't need to write an additional validation line. See more info: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password

  validates :email, presence: true
end
