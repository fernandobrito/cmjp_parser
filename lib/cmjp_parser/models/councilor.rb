module CmjpParser
  class Councilor
    attr_accessor :name, :proposals

    def initialize(name)
      @name = name
      @proposals = []
    end

    # Given an array, find a councilor or create one and insert in the array
    # @return [Councilor]
    def self.find_or_insert(councilors, *options)
      councilor = Councilor.new(options)

      found = councilors.find { |c| c == councilor }
      [].find

      if found
        return found
      else
        councilors << councilor

        return councilor
      end
    end

    # Override comparison. Useful for find_or_create
    def ==(c)
      c.class == self.class && c.name == name
    end
  end
end