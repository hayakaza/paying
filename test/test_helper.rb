require "rubygems"

require 'test/unit'
require 'mocha/setup'
require 'shoulda'

require File.dirname(__FILE__) + '/../lib/key_pay.rb' unless defined?(KeyPay)

module TestHelper
  STUB_KEYPAY_CALLS = ENV["STUB_KEYPAY_CALLS"].nil? ? true : (ENV["STUB_KEYPAY_CALLS"] == "true") unless defined? STUB_KEYPAY_CALLS

  API_KEY = ENV["API_KEY"] || "fake_key" unless defined?(API_KEY)

  # Helper constant for checking regex
  GUID_REGEX = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ unless defined?(GUID_REGEX)


  def dummy_business
    KeyPay::Business.new(API_KEY,
      :name => "My Business #{Time.now.to_i}",
      :abn => 24133952824,
      :legal_name => "Employment Innovations Pty Ltd #{Time.now.to_i}",
      :contact_name => "Business Contact #{Time.now.to_i}",
      :contact_email_address => "my@business.com",
      :contact_phone_number => "123456",
      :external_id => "TGE",
      :standard_hours_per_day => 9
    )
  end

end
