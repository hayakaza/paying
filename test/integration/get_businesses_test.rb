require File.dirname(__FILE__) + '/../test_helper'

class GetBusinessesTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @keypay = KeyPay::Business

    if STUB_KEYPAY_CALLS
      KeyPay::Business.stubs(:all).with(API_KEY).returns(dummy_businesses)
    end
    @result = KeyPay::Business.all(API_KEY)
    @new_business = dummy_businesses.first
  end

  context "test_get_business" do
    should "not be nil" do
      assert !@result.nil?
      assert_equal @result.size, 3
    end

    should "handle the business name" do
      assert_equal @result.first.name, @new_business.name
    end

    should "handle the external ID" do
      assert_equal @result.first.external_id, @new_business.external_id
    end

    should "handle the abn" do
      assert_equal @result.first.abn, @new_business.abn
    end

    should "handle the contact name" do
      assert_equal @result.first.contact_name, @new_business.contact_name
    end

    should "handle the contact email address" do
      assert_equal @result.first.contact_email_address, @new_business.contact_email_address
    end

    should "handle the contact phone number" do
      assert_equal @result.first.contact_phone_number, @new_business.contact_phone_number
    end
  end
end
