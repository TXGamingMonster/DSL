require_relative "processor.rb"
require "test/unit"

class TestProcessor < Test::Unit::TestCase

	#check that Processor responds to methods in business file
	def test_response
		assert_respond_to(Processor, :product)
	end
	
end