module Dota2api
  mattr_accessor :api_key
  @@api_key = nil
  def self.configure
    yield self
  end

  def self.root
    Gem::Specification.find_by_name("dota2api").gem_dir
  end
end

require 'dota2api/request'
require 'dota2api/map'
