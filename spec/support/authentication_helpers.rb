# frozen_string_literal: true

module AuthenticationHelpers
  module Controller
    def sign_in(user)
      allow(controller).to receive(:current_user).and_return user
    end

    def sign_out
      sign_in GuestUser.new({})
    end

    def http_login(user, password)
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
    end
  end

  MAX_ATTEMPTS = 5
  module Feature
    def sign_in(user)
      visit_login_path
      wait_for_mount(true)
      submit_login_form(user)
    end

    def sign_out
      visit logout_path
    end

    def submit_login_form(user)
      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'

      click_on 'Log In'

      # Wait for the user to sign in successfully before moving on
      wait_for_ajax
    end

    # On CircleCI, the first time visiting the login path will
    # result in a error:
    #
    #   Capybara::Poltergeist::StatusFailError:
    #   Request to 'http://127.0.0.1:49525/login' failed to reach server, check DNS and/or server status
    # All subsequent attempts work. This happens to others but mostly the fix is to upgrade to
    # the latest version. We are on the latest version. Also we might be able to fix by precompiling assests.
    def visit_login_path
      on_retry = proc do |try|
        p "rescuing from login path, attempt: #{try}"
      end

      Retriable.retriable tries: 5, on_retry: on_retry do
        visit login_path
      end
    end
  end

  module Request
    def json_headers
      { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    end

    def http_headers(user)
      token = create_access_token_if_needed(user)
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Token token=#{token&.token}",
        'API-VERSION' => '8'
      }
    end

    def create_access_token_if_needed(user)
      return nil unless user

      token = AccessToken.find_by(user: user)
      return token unless token.nil?

      AccessToken.create(user: user)
    end
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers::Controller, type: :controller
  config.include AuthenticationHelpers::Feature, type: :feature
  config.include AuthenticationHelpers::Request, type: :request
end
