require "pry"
require_relative "concerns/memorable.rb"

class Artist
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if !song.artist
  end

end
