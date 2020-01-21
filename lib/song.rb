require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
     @name = name
     self.artist = artist if !artist.nil?
     self.genre = genre if !genre.nil?
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  #def self.find_by_name(name)
  #  @@all.find {|song| song.name == name}
  #end

  #def self.find_or_create_by_name(name)
  #  if self.find_by_name(name).nil?
  #    self.create(name)
  #  else
  #    self.find_by_name(name)
  #  end
  #end

  def self.destroy_all
    @@all = []
  end
end
