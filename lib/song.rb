require "pry"
require_relative "concerns/memorable.rb"
require_relative "concerns/findable.rb"

class Song
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    super
    self.artist=(artist) unless !artist
    self.genre=(genre) unless !genre
  end

  def artist=(artist)
      @artist = artist if !self.artist
      artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre if !self.genre
      genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    info = filename.chomp(".mp3").split(" - ")
    # binding.pry
    Song.new(info[1],
      Artist.find_or_create_by_name(info.first),
      Genre.find_or_create_by_name(info.last))
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
end
