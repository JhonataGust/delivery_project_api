require "test_helper"

class ClientsMailerTest < ActionMailer::TestCase
  test "confirmation" do
    mail = ClientsMailer.confirmation
    assert_equal "Confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
