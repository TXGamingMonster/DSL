require_relative "processor.rb"
require "test/unit"

class TestProcessor < Test::Unit::TestCase

	#check that Processor responds to methods
	def test_response
		assert_respond_to(Processor.instance, :getProducts)
		assert_respond_to(Processor.instance, :add_product)
		assert_respond_to(Processor.instance, :last_product)
		assert_respond_to(Processor.instance, :print)
		assert_respond_to(Processor.instance, :loadRules)
	end
	def testFiles
		#check that bad file throws error
		assert_raise NoMethodError do
			Processor.instance.load "businessRules.txt"
		end
		#check that valid file throws no error
		
	end
	
	
end