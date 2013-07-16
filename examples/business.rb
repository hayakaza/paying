require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

business = KeyPay::Business.new(KEY["api_key"])
pp business.all.inspect
