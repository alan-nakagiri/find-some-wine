# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  #   before_action :basic_auth_if_needed?
  #   before_action :ensure_logged_in
  #   before_action :set_user_time_zone

  after_action :verify_authorized
  after_action :verify_policy_scoped, only: :index

  include UserAuthorization

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  #   def set_user_time_zone
  #     return if !current_user || current_user.time_zone.present? || cookies['browser.timezone'].blank?
  #     current_user.time_zone = cookies['browser.timezone']
  #     current_user.save
  #   end

  #   def redirect_if_logged_in
  #     return unless user_signed_in?
  #     redirect_to home_path
  #   end

  #   def home_path
  #     return admin_path if current_user.admin?
  #     return coach_users_path if current_user.coach?
  #     return coach_users_path if current_user.escalation?
  #     return member_home_path if current_user.member?
  #     root_path
  #   end

  #   def member_home_path
  #     return download_path if current_user.currently_active_subscription_is_research? && !mobile_api_request
  #     return recipes_path if current_user.currently_active_subscription_is_graduate?

  #     root_path
  #   end
end
