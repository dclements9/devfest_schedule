require 'nokogiri'
require 'pry'
require 'open-uri'

require_relative './devfest_schedule/version'
require_relative './devfest_schedule/cli'
require_relative './devfest_schedule/talk'
require_relative './devfest_schedule/user_schedule'

module DevfestSchedule
  class Error < StandardError; end
  # Your code goes here...
end
