# frozen_string_literal: true

# http://viget.com/extend/auto-saving-screenshots-on-test-failures-other-capybara-tricks
RSpec.configure do |config|
  config.after do |example|
    if example.exception && example.metadata[:js]
      meta = example.metadata
      filename = File.basename(meta[:file_path])
      line_number = meta[:line_number]
      timestamp = Time.zone.now.to_i
      screenshot_name = "screenshot-#{filename}-#{line_number}-#{timestamp}.png"
      screenshot_path = Rails.root.join('tmp', 'screenshots', screenshot_name)

      page.save_screenshot(screenshot_path)

      puts meta[:full_description] + "\n  Screenshot: #{screenshot_path}"
    end
  end

  config.after do |example|
    if example.exception && example.metadata[:js]
      Rails.logger.debug("\n\n")
      Rails.logger.debug('SPEC FAILURE')
      Rails.logger.debug("page.current_url: #{page.current_url}")

      Rails.logger.debug('page.html:')
      Rails.logger.debug(page.html.to_s)
      Rails.logger.debug("\n\n")
    end
  end
end
