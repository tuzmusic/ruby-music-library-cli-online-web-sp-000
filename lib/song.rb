require "pry"
require_relative "concerns/memorable.rb"

class Song
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    super
    self.artist=(artist) unless !artist
    self.genre=(genre) unless !genre
  end

  def artist=(artist)
    # binding.pry
      @artist = artist if !self.artist
      artist.add_song(self)
  end

  def genre=(genre)
    # binding.pry
      @genre = genre if !self.genre
      genre.add_song(self)
  end

  def self.all
    @@all
  end

end
