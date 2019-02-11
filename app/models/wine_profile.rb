# frozen_string_literal: true

class WineProfile < ApplicationRecord
  belongs_to :wine
  belongs_to :varietal
end
