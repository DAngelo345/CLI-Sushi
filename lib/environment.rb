require_relative "./cli_sushi/version"
require_relative "./api"
require_relative "./cli"
require_relative "./sushi"
require 'pry'
require 'open-uri'
require 'net/http'
require 'json'


module CliSushi
  class Error < StandardError; end
  # Your code goes here...
end
