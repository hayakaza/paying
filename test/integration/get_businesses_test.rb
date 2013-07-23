require File.dirname(__FILE__) + '/../test_helper'

class BusinessListTest < Test::Unit::TestCase
  include TestHelper

  def setup
    # @keypay = KeyPay::API.new(API_KEY, :api_url => 'DUMMY_URL')
    @keypay = KeyPay::Business

    if STUB_KEYPAY_CALLS
      KeyPay::Business.stubs(:all).with(API_KEY).returns(dummy_business)
    end
    @result = KeyPay::Business.all(API_KEY)
    @new_business = dummy_business
  end

  context "test_get_business" do
    should "not be nil" do
      assert !@result.nil?
    end

    should "handle the business name" do
      assert_equal @result.name, @new_business.name
    end

    should "handle the external ID" do
      assert_equal @result.external_id, @new_business.external_id
    end

    should "handle the abn" do
      assert_equal @result.abn, @new_business.abn
    end

    should "handle the contact name" do
      assert_equal @result.contact_name, @new_business.contact_name
    end

    should "handle the contact email address" do
      assert_equal @result.contact_email_address, @new_business.contact_email_address
    end

    should "handle the contact phone number" do
      assert_equal @result.contact_phone_number, @new_business.contact_phone_number
    end
  end
end
