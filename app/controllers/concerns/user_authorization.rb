# frozen_string_literal: true

module UserAuthorization
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= user_from_session
  end

  def set_current_user!(user)
    session[:user_id] = user.id
    save_mobile_app_version(user)
    @current_user = user
  end

  def user_signed_in?
    current_user.present? && current_user.logged_in?
  end

  def user_from_session
    session[:user_id] && User.where(id: session[:user_id]).first
  end

  def ensure_logged_in
    return if user_signed_in?

    if request.xhr?
      render status: 401, body: nil
    else
      # session[:after_login_redirect_to] = request.path unless request.path == '/logout'
      # redirect_to login_url
    end
  end

  # def check_basic_auth
  #   if Rails.env.acceptance? || Rails.env.staging?
  #     authenticate_or_request_with_http_basic do |name, password|
  #       name == 'better' && password == ENV['BASIC_AUTH_PASSWORD']
  #     end
  #   end
  # end

  def basic_auth_if_needed?
    return if ActionController::HttpAuthentication::Token.token_and_options(request)
    # check_basic_auth
  end

  included do
    helper_method :current_user
    helper_method :user_signed_in?
    helper_method :mobile_api_request
  end
end
