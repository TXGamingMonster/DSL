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
		#assert invalid file raises error
		assert_raise NoMethodError do
			Processor.instance.loadRulesNoRescue "badRules.txt"
		end
		#assert valid file doesn't raise error
		assert_nothing_raised NoMethodError do
			Processor.instance.loadRules "businessRules2.txt"
		end
	end
	
end