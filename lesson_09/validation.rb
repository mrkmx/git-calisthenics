# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :checks

    def validate(type, arg, option = nil)
      @checks ||= []
      @checks << { type: type, arg: arg, option: option }
    end
  end

  module InstanceMethods
    def validate!
      self.class.checks.each do |item|
        send("validate_#{item[:type].to_sym}", instance_variable_get("@#{item[:arg]}".to_sym), item[:option])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def presence(value)
      raise 'Value cant\'t be empty' if value.empty?
    end

    def format(value, options)
      raise 'Wrong format' if value !~ options
    end

    def type(value, options)
      raise 'Mismatched class' if value.class == options
    end
  end
end
