require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')

class GuestsTest < MiniTest::Test

  def setup
    @guest1 = Guests.new("Ross")
  end

  def test_guest_has_name
    assert_equal("Ross", @guest1.guest_name)
  end
end
