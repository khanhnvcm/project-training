# frozen_string_literal: true

namespace :factory_bot do
  desc 'factories are valid?'
  task lint: :environment do
    abort 'run on test environment' unless Rails.env.test?
    begin
      DatabaseCleaner[:active_record].strategy = :transaction
      DatabaseCleaner[:active_record].clean_with(:truncation)
      # Rake::Task['db:seed'].invoke
      DatabaseCleaner.start
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
