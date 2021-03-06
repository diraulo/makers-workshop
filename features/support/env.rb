# Generated by cucumber-sinatra. (2015-11-16 12:55:09 +0200)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'application.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = WorkshopApp

class WorkshopAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  WorkshopAppWorld.new
end
