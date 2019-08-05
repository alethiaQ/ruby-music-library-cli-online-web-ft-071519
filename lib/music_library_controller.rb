class MusicLibraryController
attr_accessor :path


  def initialize(path="./db/mp3s")
    @path = path
    my_music = MusicImporter.new(path)
    my_music.import
  end

  def call
    puts "Welcome to your music library!"
    self.call_info
    input = gets.chomp

    while input != "exit"
      case input
      when "list songs"
        p Song.all
      when "list artists"
        p Artist.all
      when "list genres"
        p Genre.all
      when "exit"
        break
      end
      self.call_info
    end

  end

  def list_songs
    sorted = Song.all.sort_by {|song| song.name}
    sorted.each_with_index do |song, index|
      puts "#{index +1 }. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted = Artist.all.sort_by {|artist| artist.name}
    sorted.each_with_index do |artist, index|
      puts "#{index +1 }. #{artist.name}"
    end
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}
    sorted.each_with_index do |genre, index|
      puts "#{index +1 }. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.chomp
    artist = Artist.find_or_create_by_name(input_artist)
    sorted = artist.songs.sort_by {|song| song.name}
    sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.chomp
    genre = Genre.find_or_create_by_name(genre_input)
    sorted = genre.songs.sort_by {|song| song.name}
    sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.chomp.to_i
    if (1..Song.all.length).include?(song_num)
      song = Song.all.sort {|song, other| song.name <=> other.name}
      end
      puts "Playing #{song.name} by #{song.artist.name}" if song

  end

  def call_info

    puts"To list all of your songs, enter 'list songs'."
    puts"To list all of the artists in your library, enter 'list artists'."
    puts"To list all of the genres in your library, enter 'list genres'."
    puts"To list all of the songs by a particular artist, enter 'list artist'."
    puts"To list all of the songs of a particular genre, enter 'list genre'."
    puts"To play a song, enter 'play song'."
    puts"To quit, type 'exit'."
    puts"What would you like to do?"
  end
  end
