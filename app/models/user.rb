class User < ApplicationRecord
  has_many :articles
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {
    self.email = email.downcase
  }
  # The before_save function will run code before saving the object to the database. 
  
  validates :username, 
  presence: true, 
  uniqueness: { case_sensitive: false }, 
  length: { minimum: 3, maximum: 25 }

  validates :email, 
    presence: true, 
    uniqueness: true, 
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
end