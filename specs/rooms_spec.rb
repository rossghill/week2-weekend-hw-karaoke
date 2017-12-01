require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms.rb')
require_relative('../guests.rb')
require_relative('../songs.rb')

class RoomsTest < MiniTest::Test

  def setup
    @room = Rooms.new("The Party Room")
  end

  def test_room_has_name
    assert_equal("The Party Room", @room.room_name)
  end

end
