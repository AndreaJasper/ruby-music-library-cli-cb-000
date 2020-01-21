require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
     @name = name
     @songs = []
     @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if @songs.include?(song)
      nil
    else
      @songs << song
    end
  end

  def genres
    genre_array = []
    @songs.map do |song|
      if genre_array.include?(song.genre)
        nil
      else
       genre_array << song.genre
     end
   end
   genre_array
  end

  def self.destroy_all
    @@all = []
  end
end
