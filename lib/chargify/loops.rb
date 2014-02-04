module Chargify
  module Loops
    def self.delegate_hook(event, payload)
      loops[event].each do |block|
        block.call payload
      end

      loops[:all].each do |block|
        block.call event, payload
      end
    end

    def self.loops
      @loops ||= Hash.new { |hash, key| hash[key] = [] }
    end

    def self.loop!(event, &block)
      events = event.kind_of?(Array) ? event : [event]
      events.each do |event|
        loops[event] ||= []
        loops[event]  << block
      end
    end

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
