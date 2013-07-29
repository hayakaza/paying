require File.dirname(__FILE__) + '/../test_helper'

class UpdateLocationTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @location = dummy_location
    @location.name = LOCATION_NAME
    @location.source = SOURCE
    @location.external_id = EXTERNAL_ID

    if STUB_KEYPAY_CALLS
      @location.stubs(:update).with(API_KEY, ID).returns(@location)
    end
  end

  context "update_employee" do
    should "not be nil" do
      assert !@location.nil?
    end

    should "handle the external ID" do
      assert_equal @location.external_id, EXTERNAL_ID
    end

    should "handle the name" do
      assert_equal @location.name, LOCATION_NAME
    end

    should "handle the contact source" do
      assert_equal @location.source, SOURCE
    end
  end
end
