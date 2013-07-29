require File.dirname(__FILE__) + '/../test_helper'

class GetLocationTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @keypay = KeyPay::Location

    if STUB_KEYPAY_CALLS
      KeyPay::Location.stubs(:get_by_id).with(API_KEY, ID).returns(dummy_location)
    end
    @result = KeyPay::Location.get_by_id(API_KEY, ID)
    @location = dummy_location
  end

  context "test_get_location" do
    should "not be nil" do
      assert !@result.nil?
    end

    should "handle the location name" do
      assert_equal @result.name, @location.name
    end

    should "handle the external ID" do
      assert_equal @result.external_id, @location.external_id
    end

    should "handle the state" do
      assert_equal @result.state, @location.state
    end

    should "handle the source" do
      assert_equal @result.source, @location.source
    end

    should "handle the fully_qualified_name" do
      assert_equal @result.fully_qualified_name, @location.fully_qualified_name
    end

    should "handle the parent id" do
      assert_equal @result.parent_id, @location.parent_id
    end

    should "handle the business_id id" do
      assert_equal @result.business_id, @location.business_id
    end    
  end
end
