class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :name, presence: true, length: Settings.name_max
  validates :email, presence: true, length: Settings.email_max,
    format: VALID_EMAIL_REGEX,
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: Settings.pass_min
  before_save :check
  private
  def check
    self.email = email.downcase!
  end
end
