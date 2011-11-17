module Chargify
  module Loops
    def self.shared_key
      @shared_key || ''
    end

    def self.shared_key=(key)
      @shared_key = key
    end
  end
end

require 'digest/md5'

require 'chargify/loops/version'
require 'chargify/loops/engine'