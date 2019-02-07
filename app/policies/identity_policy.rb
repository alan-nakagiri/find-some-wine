# frozen_string_literal: true

class IdentityPolicy < ApplicationPolicy
  def create?
    # @user
    true
  end

  # alias forgot_password? user_is_not_logged_in?
  # alias create? user_is_not_logged_in?
  # alias show? always_allowed

  # alias update? always_allowed
  # alias edit? always_allowed
  # alias available? always_allowed
end
