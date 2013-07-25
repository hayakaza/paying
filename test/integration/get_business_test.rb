require File.dirname(__FILE__) + '/../test_helper'

class GetBusinessTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @keypay = KeyPay::Business

    if STUB_KEYPAY_CALLS
      KeyPay::Business.stubs(:get_by_id).with(API_KEY, ID).returns(dummy_business)
    end
    @result = KeyPay::Business.get_by_id(API_KEY, ID)
    @business = dummy_business
  end

  context "test_get_business" do
    should "not be nil" do
      assert !@result.nil?
    end

    should "handle the business name" do
      assert_equal @result.name, @business.name
    end

    should "handle the external ID" do
      assert_equal @result.external_id, @business.external_id
    end

    should "handle the abn" do
      assert_equal @result.abn, @business.abn
    end

    should "handle the contact name" do
      assert_equal @result.contact_name, @business.contact_name
    end

    should "handle the contact email address" do
      assert_equal @result.contact_email_address, @business.contact_email_address
    end

    should "handle the contact phone number" do
      assert_equal @result.contact_phone_number, @business.contact_phone_number
    end
  end
end
