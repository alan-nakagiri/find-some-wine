# frozen_string_literal: true

# Good read on using database_cleaner (in lieu of a shared connection):
# - http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
    FactoryBot.reload
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, nontransactional: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do |example|
    # Prevents feature specs from finishing while things
    # might still be going on.
    if example.metadata[:js]
      wait_for_ajax
      wait_for_mount(false)
      Capybara.reset_sessions!
    end
    DatabaseCleaner.clean
  end
end
