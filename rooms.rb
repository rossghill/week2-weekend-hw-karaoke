class Rooms

attr_reader :room_name, :room_capacity, :room_fee

  def initialize (room_name, room_capacity, room_fee)
    @room_name = room_name
    @guests_in_room = []
    @songs_in_room = []
    @room_capacity = room_capacity
    @room_fee = room_fee
  end

  def guest_count
    @guests_in_room.length()
  end

  def add_guest_to_room(guest_name)
    @guests_in_room << guest_name
  end

  def remove_guest_from_room(guest_name)
    @guests_in_room.delete(guest_name)
  end

  def room_capacity_check
    if guest_count > @room_capacity
      return "Room full!"
    else
      return guest_count
    end
  end

  def song_count
    @songs_in_room.length()
  end

  def add_song_to_room(song)
    @songs_in_room << song
  end


end
