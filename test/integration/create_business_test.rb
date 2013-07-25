require File.dirname(__FILE__) + '/../test_helper'

class CreateBusinessTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @business = dummy_business

    if STUB_KEYPAY_CALLS
      @business.stubs(:create).with(API_KEY, ID).returns(dummy_business)
    end
    @dummy_business = dummy_business
  end

  context "test_get_business" do
    should "not be nil" do
      assert !@business.nil?
    end

    should "handle the business name" do
      assert_equal @dummy_business.name, @business.name
    end

    should "handle the external ID" do
      assert_equal @dummy_business.external_id, @business.external_id
    end

    should "handle the abn" do
      assert_equal @dummy_business.abn, @business.abn
    end

    should "handle the contact name" do
      assert_equal @dummy_business.contact_name, @business.contact_name
    end

    should "handle the contact email address" do
      assert_equal @dummy_business.contact_email_address, @business.contact_email_address
    end

    should "handle the contact phone number" do
      assert_equal @dummy_business.contact_phone_number, @business.contact_phone_number
    end
  end
end
