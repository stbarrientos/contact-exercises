require 'yaml'

class MusicParser

	@@hash = {}

	def hash
		@@hash
	end

  # Implement a method parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
  	# Open and read the file, store it as a variable 'file'
  	file = open(filename, &:read)

  	# Convert the file variable into a hash so that we can use the [] operator
  	@@hash = YAML.load(file)
  	custom = SpecialObject.new(@@hash)

	end
end

class SpecialObject < MusicParser

	# Save the input object in an instance variable
	def initialize(hash)
		@object_hash = hash
	end

	# Catch missing method errors here and try to build the ones we need
	def method_missing(meth_sym, *args, &block)

		# If the object that has been passed in is an array, we have to treat it differently
		if @object_hash.class == Array

			# We only need to cover the first and last methods for the arrays, so we are going to
			# check what the user called and act accordingly
			if meth_sym.to_s == "first"

				# If the array.first call returns a string (as opposed to other data types) then that is the answer we want to return
				# Otherwise return a ew SpecialObject with the modified object as the argument
				@object_hash[0].class == String ? @object_hash[0] : SpecialObject.new(@object_hash[0])
			else
				@object_hash[-1].class == String ? @object_hash[-1] : SpecialObject.new(@object_hash[-1])
			end

		# If the user tries to access the hash with the [] operator, let them, and just return a hash
		elsif meth_sym.to_s == "[]"
			@object_hash[*args]

		# If the hash has a key that is the same as the method they called, return the value
		elsif @object_hash[meth_sym.to_s]

			# If the key has a value that is a string, that is the last step in the chain. Otherwise, return a new special object
			@object_hash[meth_sym.to_s].class == String ? @object_hash[meth_sym.to_s] : SpecialObject.new(@object_hash["#{meth_sym}"])
		
		# If none of the above is true, throw a no method error
		else
			super
		end
	end

	# Make sure we respond to the new methods we are creating
	def respond_to?(meth_sym, private_method = false)
		true
	end
end

