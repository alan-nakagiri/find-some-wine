# frozen_string_literal: true
module Api
  class WineriesController < ApplicationController
    # skip_before_action :ensure_logged_in
    skip_before_action :verify_authenticity_token

    skip_after_action :verify_policy_scoped
    skip_after_action :verify_authorized

    def index
      @wineries = Winery.all
    end
  end
end
