# frozen_string_literal: true

class UserCreator
  attr_accessor :user_params

  def initialize(user_params)
    @user_params = user_params
  end

  def perform
    ap 'user creator perform'

    User.transaction do
      create_identity
      ap @identity
      @errors = @identity.errors
      return unless @errors.empty?

      create_user
      ap @user
      @errors = @user.errors
      return if @errors.present?
    end

    true
  end

  def identity_attributes
    params = user_params

    # if user_params.key?(:password)
    #   params[:user_updated_password_at] = Time.zone.now
    # else
    #   params[:password] = SecureRandom.base64(24)
    # end
    params
  end

  def create_identity
    @identity = Identity.create(identity_attributes)
  end

  def user_attributes(identity)
    # user_params.merge(provider: 'identity', uid: identity.id).except(:password)
    user_params.merge(uid: identity.id).except(:password)
  end

  def create_user
    @user = @identity ? User.create(user_attributes(@identity)) : User.create(user_params)
  end
end
