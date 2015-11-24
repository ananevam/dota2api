module Dota2api
  mattr_accessor :api_key
  @@api_key = nil
  def self.configure
    yield self
  end
end

require 'dota2api/request'
