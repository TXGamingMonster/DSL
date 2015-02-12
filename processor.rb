require 'singleton'
class Processor
	include Singleton
	attr_reader :products

	def initialize
		@products = []
	end

	def add_product(product)
		@products << product
	end

	def last_product
		@products.last
	end

	def print
		@products.each do |product|
			product.print
		end
	end

end

class Product
	attr_reader :name, :actions
	
	def initialize(name)
		@name = name
		@actions = []
		@addons = []
		if name == 'membership'
			@active = false
		end
	end

	def add_action(action)
		@actions << action
	end
	
	def add_addon(addon)
		@addons << addon
	end

	def display_actions
		@actions.each do |action|
			puts action[i]	
		end
	end
	
	def set_activate(boo)
		@active = boo
	end
	
	def display_includes
		@addons.each do |addon|
			puts addon[i]	
		end
	end

	def print
		puts "\nProcessing order for a: #{@name}"
		@actions.each do |action|
			action.print
		end
		
		puts "*Includes free: " unless @addons.size == 0
		@addons.each do |addon|
			addon.print
		end
	end

end

class Action
	attr_reader :text

	def initialize(text)
		@text = text
	end
		
	def print
		puts "---- #{@text}"
	end

end

class Addon
	attr_reader :text

	def initialize(text)
		@text = text
	end
		
	def print
		puts "#{@text}"
	end

end

def product(name)
	Processor.instance.add_product Product.new(name)
end

def action(text)
	Processor.instance.last_product.add_action Action.new(text)
end

def addon(text)
	Processor.instance.last_product.add_addon Addon.new(text)
end

def activate
	Processor.instance.last_product.set_activate(true)
end

def print
	Processor.instance.print
end

load 'businessRules2.txt'

