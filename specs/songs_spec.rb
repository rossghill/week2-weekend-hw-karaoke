require('minitest/autorun')
require('minitest/rg')
require_relative('../songs.rb')

class SongsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("King Gizzard and the Lizard Wizard - Robot Stop")
  end

  def test_song_has_title
    assert_equal("King Gizzard and the Lizard Wizard - Robot Stop", @song1.title)
  end

end
