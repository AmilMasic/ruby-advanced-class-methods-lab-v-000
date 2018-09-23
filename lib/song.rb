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

  def self.find_or_create_by_name(song_string_name)
    song_exist = self.all.detect do |v|
      v.name = song_string_name
      if song_exist == nil
        song.save
        song
      else
        song_exist
      end
    end
  end
end
