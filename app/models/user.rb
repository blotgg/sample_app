# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  #attr_accessible :name, :email
  
  has_secure_password
  
  #before_save { |user| user.email = email.downcase } #альтерантива этой колбэк функции:
  before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 32 }
  VALID_EMAIL_REGEX = /\A[\w]+[\w\-.]*[\w]+@[a-z\d]+[a-z\d\-.]*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  
end
