class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_accessor :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end
end
