class WineProfile < ApplicationRecord
  belongs_to :wine
  belongs_to :varietal
end