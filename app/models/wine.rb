# frozen_string_literal: true

class Wine < ApplicationRecord
  belongs_to :winery
  has_many :wine_profiles
end
