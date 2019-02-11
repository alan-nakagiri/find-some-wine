# frozen_string_literal: true

require 'user'
class User
  def local_time(*args)
    Time.use_zone(time_zone) { Time.zone.local(*args) }
  end
end

PST = 'America/Los_Angeles'
