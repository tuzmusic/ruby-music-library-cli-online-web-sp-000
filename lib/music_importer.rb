require "pry"

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # change to the directory, unless we've already changed to the directory!
    Dir.chdir(path) unless Dir.pwd.include?(path[1..-1])
    x = Dir.glob("*")
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end


end
