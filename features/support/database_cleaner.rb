require 'database_cleaner'
require 'database_cleaner/cucumber'

DatabaseCleaner.strategy = :truncation

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
  FileUtils.rm_rf Dir['pdf/test/**/*.pdf']
  FileUtils.rm_rf Dir['assets/img/usr/test/**/*.jpg']
end
