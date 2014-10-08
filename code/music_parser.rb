require 'yaml'

class MusicParser
  # Implement a method parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
  	file = open(filename, &:read)
  	y = YAML.load(file)
  end
end

MusicParser.parse("data/music.yaml")
