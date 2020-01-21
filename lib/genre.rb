require 'pry'

class Genre
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
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    artist_array = []
    @songs.map do |song|
      if artist_array.include?(song.artist)
        nil
      else
        artist_array << song.artist
      end
    end
    artist_array
  end


  def self.destroy_all
    @@all = []
  end
end
