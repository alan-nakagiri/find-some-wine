# frozen_string_literal: true
module Api
  class Api::SessionsController < ApplicationController
    # skip_before_action :ensure_logged_in, only: %i[new create failure validate_token]
    skip_before_action :verify_authenticity_token, only: %i[create failure]
    skip_after_action :verify_policy_scoped
    skip_after_action :verify_authorized

    def new; end

    def create; end
  end
end