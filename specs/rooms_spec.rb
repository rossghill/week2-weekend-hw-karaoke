require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms.rb')
require_relative('../guests.rb')
require_relative('../songs.rb')

class RoomsTest < MiniTest::Test

  def setup
    @room_1 = Rooms.new("The Party Room", 3)
    @room_2 = Rooms.new("The Disco Room", 4)
    @guest_1 = Guests.new("Ross")
    @guest_2 = Guests.new("Michael")
    @guest_3 = Guests.new("Graeme")
    @guest_4 = Guests.new("Richard")
    @song_1 = Songs.new("Robot Stop")
    @song_2 = Songs.new("Big Fig Wasp")
    @song_3 = Songs.new("Gamma Knife")
  end

  def test_room_has_name
    assert_equal("The Party Room", @room_1.room_name())
  end

  def test_room_is_empty
    assert_equal(0, @room_1.guest_count())
  end

  def test_room_has_a_guest
    @room_1.add_guest_to_room(@guest_1)
    assert_equal(1, @room_1.guest_count)
  end

  def test_guest_can_be_removed_from_room
    @room_1.add_guest_to_room(@guest_1)
    @room_1.add_guest_to_room(@guest_2)
    @room_1.add_guest_to_room(@guest_3)
    @room_1.remove_guest_from_room(@guest_1)
    assert_equal(2, @room_1.guest_count)
  end

  def test_song_can_be_added_to_room
    @room_1.add_song_to_room(@song_1)
    @room_1.add_song_to_room(@song_2)
    assert_equal(2, @room_1.song_count)
  end

  def test_room_too_full_for_guest
    @room_1.add_guest_to_room(@guest_1)
    @room_1.add_guest_to_room(@guest_2)
    @room_1.add_guest_to_room(@guest_3)
    @room_1.add_guest_to_room(@guest_4)
    assert_equal("Room full!", @room_1.room_capacity_check)
  end

end
