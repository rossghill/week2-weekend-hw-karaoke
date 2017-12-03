require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')

class GuestsTest < MiniTest::Test

  def setup
    @guest_1 = Guests.new("Ross", 100)
  end

  def test_guest_has_name
    assert_equal("Ross", @guest_1.guest_name)
  end

  def test_guest_has_money_in_wallet
    assert_equal(100, @guest_1.wallet)
  end
end
