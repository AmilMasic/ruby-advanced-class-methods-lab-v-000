class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_string_name)
    song = self.new
    song.name = song_string_name
    song
  end

  def self.create_by_name(song_string_name)
    song = self.new
    song.name = song_string_name
    song.save
    song
  end

  def self.find_by_name(song_string_name)
    @@all.find { |song| song.name == song_string_name}
  end

  # def self.find_or_create_by_name(song_string_name)
  #   song_exist = self.all.detect do |v|
  #     v.name = song_string_name
  #     if song_exist == nil
  #       song.save
  #       song
  #     else
  #       song_exist
  #     end
  #   end
  def self.find_or_create_by_name(find_this_song)
    # This method will accept a string name for a song and
    # either return a matching song instance with that name
    # or create a new song with the name and return the song instance.
    did_i_find_it = self.all.detect {|x| x.name == find_this_song}
    if did_i_find_it == nil
      # song.create_by_name
      song = self.new
      song.name = find_this_song
      song.save
      song
    else
      did_i_find_it
    end
  end
end
