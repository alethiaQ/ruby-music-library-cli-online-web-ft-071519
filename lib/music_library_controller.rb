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
