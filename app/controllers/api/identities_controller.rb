# frozen_string_literal: true
module Api
  class IdentitiesController < ApplicationController
    def create
      authorize Identity
      # referrer_id = request_referrer
      ap session[:referrer_id]

      creator = UserCreator.new(identity_params)
      creator.perform
      ap creator
      # handle_user_creator_result(creator)
    end

    private

    def handle_user_creator_result(creator)
      if creator.errors.empty?
        # establish_session(creator.identity)
        # create_access_token if mobile_api_request
      else
        @errors = creator.errors.messages
      end
    end

    def identity_params
      params
        .require(:identity)
        .permit(:first_name, :last_name, :email, :password)
    end
  end
end
