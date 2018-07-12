class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :name,  presence: true, length: {maximum: Settings.name_max}
  validates :email, presence: true, length: {maximum: Settings.email_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.pass_min}
  before_save :check
  private
  def check
    email.downcase!
  end
end
