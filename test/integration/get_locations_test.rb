require File.dirname(__FILE__) + '/../test_helper'

class GetLocationsTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @keypay = KeyPay::Location

    if STUB_KEYPAY_CALLS
      KeyPay::Location.stubs(:all).with(API_KEY, ID).returns(dummy_locations)
    end
    @result = KeyPay::Location.all(API_KEY, ID)
    @location = dummy_locations.last
  end

  context "test_get_locations" do
    should "not be nil" do
      assert !@result.nil?
      assert_equal @result.size, 3
    end

    should "handle the location name" do
      assert_equal @result.last.name, @location.name
    end

    should "handle the external ID" do
      assert_equal @result.last.external_id, @location.external_id
    end

    should "handle the state" do
      assert_equal @result.last.state, @location.state
    end

    should "handle the source" do
      assert_equal @result.last.source, @location.source
    end

    should "handle the fully_qualified_name" do
      assert_equal @result.last.fully_qualified_name, @location.fully_qualified_name
    end

    should "handle the parent id" do
      assert_equal @result.last.parent_id, @location.parent_id
    end

    should "handle the business_id id" do
      assert_equal @result.last.business_id, @location.business_id
    end    
  end
end 
