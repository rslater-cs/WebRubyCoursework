require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("ryan.slater157@gmail.com", "Ryan Slater", "0123456789", @message = "Hello")

    assert_equal ['info@postboard.com'], mail.to
    assert_equal ['info@postboard.com'], mail.from
  end
end
