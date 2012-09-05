# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  # Make sure email is all lowercase before saving to DB
  before_save { |user| user.email = email.downcase }

  # Name must be filled out and no longer than 50 chars
  validates :name, presence: true, length: { maximum: 50 }

  # Email must be filled out, unique, and look like an email. Regex can be explored here: http://rubular.com/r/RPqi4pyp5X
  VALID_EMAIL_REGEX = /\A[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Password must exist & be at least 6 chars
  validates :password, presence: true, length: { minimum: 6 }

  # The password confirmation must also exist
  validates :password_confirmation, presence: true
end
