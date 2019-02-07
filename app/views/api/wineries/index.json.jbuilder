# frozen_string_literal: true
json.wineries @wineries do |winery|
  json.id winery.id
  json.name winery.name
end
