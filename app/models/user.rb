class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, 
  presence: true, 
  uniqueness: { case_sensitive: false }, 
  length: { minimum: 3, maximum: 25 }

  validates :email, 
    presence: true, 
    uniqueness: true, 
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }
end