class Song

  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist= artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist unless self.artist != nil
    artist.add_song(self) unless @artist == nil
end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)

    artist_name, song_title, genre = filename.split(" - ")
    genre_name = genre.gsub(".mp3","")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_title, artist, genre)

  end

  def self.create_from_filename(filename)
    created = self.new_from_filename(filename)
    created.save
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

   def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end



end
