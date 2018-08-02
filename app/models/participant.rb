require 'carrierwave/orm/activerecord'

class Participant < ApplicationRecord
  attr_accessor :remember_token

  before_save { email.downcase! }
  has_secure_password
  mount_uploader :picture, ParticipantPictureUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name,              presence: true, length: { maximum: 25 }
  validates :last_name,               presence: true, length: { maximum: 25 }
  validates :email,                   presence: true, length: { maximum: 255 }, 
                                            format: { with: VALID_EMAIL_REGEX }, 
                                            uniqueness: { case_sensitive: false }
  validates :phone_number,            presence: true, length: { minimum: 10, maximum: 10 }
  validates :address,                 presence: true, length: { maximum: 255 }
  validates :city,                    presence: true, length: { maximum: 255 }
  validates :state,                   presence: true, length: { maximum: 2 }
  validates :zip,                     presence: true, length: { maximum: 5 }
  validates :birthdate,               presence: true
  validates :password,                presence: true, length: { minimum: 6 }, allow_nil: true
  validate  :picture_size

  #returns hash digest of given string
  def Participant.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns random token
  def Participant.new_token
    SecureRandom.urlsafe_base64
  end

  #remembers participant in db which allows persistant session
  def remember
    self.remember_token = Participant.new_token
    update_attribute(:remember_digest, Participant.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end