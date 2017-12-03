class Guests

attr_reader :guest_name, :wallet

  def initialize(guest_name, wallet)
    @guest_name = guest_name
    @wallet = wallet
  end

  def pay_room_fee(guest, fee)
    @wallet -= fee
  end


end
