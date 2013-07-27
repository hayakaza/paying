require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

# Example Business API Call
businesses = KeyPay::Business.all(KEY["api_key"])
pp "**** All Business IDs"
businesses_ids = businesses.map { |business| business.id }
pp businesses_ids

pp "**** All Locations"
locations = KeyPay::Location.all(KEY["api_key"], businesses_ids.first)
pp locations

pp "**** Location BY ID"
location_by_id = KeyPay::Location.get_by_id(KEY["api_key"], businesses_ids.first, locations.first.id)
pp location_by_id

pp "***** Create Location"
new_location = KeyPay::Location.new(KEY["api_key"],{
  :business_id => businesses_ids.first,
  :name       => "Heart Town4",
  :state      => "ACT",
  :external_id => "L0012"}
).create

pp new_location

new_location = locations.last
new_location.name = "Heart Town 4489"
new_location.update

pp "**** Location BY ID of New Location"
location_by_id = KeyPay::Location.get_by_id(KEY["api_key"], new_location.business_id, new_location.id)
pp location_by_id

pp "**** DELETE LOCATION"
pp locations.last.delete
