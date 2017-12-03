require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms.rb')
require_relative('../guests.rb')
require_relative('../songs.rb')

class RoomsTest < MiniTest::Test

  def setup
    #room = Rooms.new(room_name, room_capacity, room_fee)
    @room_1 = Rooms.new("The Party Room", 3, 20)
    @room_2 = Rooms.new("The Disco Room", 4, 25)
    #guest = Guests.new(guest_name, wallet)
    @guest_1 = Guests.new("Ross", 100)
    @guest_2 = Guests.new("Michael", 40)
    @guest_3 = Guests.new("Graeme", 50)
    @guest_4 = Guests.new("Richard",10)
    #song = Songs.new(artist, title)
    @song_1 = Songs.new("King Gizzard and the Lizard Wizard", "Robot Stop")
    @song_2 = Songs.new("King Gizzard and the Lizard Wizard", "Big Fig Wasp")
    @song_3 = Songs.new("King Gizzard and the Lizard Wizard", "Gamma Knife")
    playlist = [@song_1, @song_2, @song_3]
  end

  def test_room_has_name
    assert_equal("The Party Room", @room_1.room_name())
  end

  def test_room_has_fee
    assert_equal(25, @room_2.room_fee)
  end

  def test_room_has_a_capacity
    assert_equal(3, @room_1.room_capacity)
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

  # def test_room_playlist
  #   @room_1.add_song_to_room(@song_1)
  #   @room_1.add_song_to_room(@song_2)
  #   assert_equal(playlist, @room_1.songs_in_room)
  # end

  def test_room_too_full_for_guest
    @room_1.add_guest_to_room(@guest_1)
    @room_1.add_guest_to_room(@guest_2)
    @room_1.add_guest_to_room(@guest_3)
    @room_1.add_guest_to_room(@guest_4)
    assert_equal("Room full!", @room_1.room_capacity_check)
  end

  def test_guest_can_pay_room_fee
    guest = @guest_1
    fee = @room_1.room_fee
    guest.pay_room_fee(guest, fee)
    assert_equal(80, guest.wallet)
  end


end
