# frozen_string_literal: true
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'type_check'

# Debugging
require 'awesome_print'
require 'pry'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each do |file|
  # skip the dummy app
  next if file.include?('support/rails_app')
  require file
end

RSpec.configure do |config|
end
