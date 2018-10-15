require "pry"

module Concerns::Memorable

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      s = self.new(name)
      s.save
      s
    end
  end

  module InstanceMethods
      def initialize(name, artist = nil, genre = nil)
        @name = name
      end

      def save
        self.class.all << self
      end
  end
end
