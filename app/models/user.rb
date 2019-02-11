# frozen_string_literal: true

class User < ApplicationRecord
  CORE_PATTERN = '[-a-zA-Z0-9_+\.]+\@([-a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,}'
end
