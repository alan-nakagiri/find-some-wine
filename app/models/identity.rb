# frozen_string_literal: true

require 'bcrypt'

class Identity < OmniAuth::Identity::Models::ActiveRecord
  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    # (?=.*[[:^alnum:]]) # Must contain a symbol
  /x.freeze

  validates :first_name, presence: true

  before_validation :format_email

  # See user.rb for explanation on why we use CORE_PATTERN
  validates :email, presence: true, uniqueness: true, format: { with: /\A#{User::CORE_PATTERN}\z/i }
  validates :password,
            length: { minimum: 8 },
            presence: true,
            format: {
              with: PASSWORD_FORMAT,
              message: 'must include at least 1 upper case character, 1 lower case character, 1 number, and 1 special character'
            }, if: :password_digest_changed?

  # def generate_recovery_token(expires_at = 6.hours.from_now)
  #   self.recovery_token = SecureRandom.hex(20)
  #   self.recovery_token_expires_at = expires_at
  #   save(validate: false)
  # end

  # def has_recovery_token_expired?
  #   Time.zone.now > recovery_token_expires_at
  # end

  # def reset_password(password)
  #   if password_repeated?(password)
  #     errors.messages[:password] = ['may not be a previous password']
  #     false
  #   else
  #     create_password_digest_for_previous_password
  #     update_attributes(
  #       password: password,
  #       recovery_token: nil,
  #       recovery_token_expires_at: nil,
  #       user_updated_password_at: Time.zone.now
  #     )
  #   end
  # end

  private

  # def password_repeated?(password)
  #   same_password?(password) || password_digests.any? { |digest| digest.equal_to_password?(password) }
  # end

  # def same_password?(password)
  #   BCrypt::Password.new(password_digest) == password
  # end

  def create_password_digest_for_previous_password
    password_digests.create(password_digest: password_digest)
    oldest_digest = password_digests.order(:created_at).limit(1).first
    oldest_digest.destroy if password_digests.count > 4
  end

  def format_email
    return if email.nil?

    self.email = email.downcase.strip
  end
end
