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

  # def self.find_by_name(name)
  #   all.find {|s| s.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end

end
