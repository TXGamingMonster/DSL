require 'singleton'
class Processor
	include Singleton
	attr_reader :products

	def initialize
		@products = []
	end

	def getProducts
		return @products
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
	
	def loadRules fileName
		begin
		puts "\nLoading \"#{fileName}\""
		load fileName
		rescue NoMethodError
			puts "Error: Undefined Method, aborting..."
		end
	end

	def loadRulesNoRescue fileName
		load fileName
	end
	
end

class Product
	attr_reader :name, :actions
	
	def initialize(name)
		@name = name
		@slips = []
		@messages = []
		@payments = []
		@warranties = []
		@addons = []
		@active = false
	end

	def getName
		return @name
	end
	
	def add_slip(slip)
		@slips << slip
	end
	
	def add_send(email)
		@messages << email
	end
	
	def add_payment(money)
		@payments << money
	end
	
	def add_slip(slip)
		@slips << slip
	end
	
	def add_warranty(war)
		@warranties << war
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
		@slips.each do |slip|
			slip.print
		end
		
		@messages.each do |message|
			message.print
		end
		
		@payments.each do |payment|
			payment.print
		end
		
		@warranties.each do |war|
			war.print
		end
		
		if(@active)
			puts "---- Activating membership"
		end
		
		puts "*Includes free: " unless @addons.size == 0
		@addons.each do |addon|
			addon.print
		end
	end

end

class PS
	attr_reader :text

	def initialize(text)
		@text = text
	end
		
	def print
		puts "---- Packing Slip for #{@text}"
	end

end

class Send
	attr_reader :text

	def initialize(text)
		@text = text
	end
		
	def print
		puts "---- Send #{@text}"
	end
end

class Payment
	attr_reader :text

	def initialize(text)
		@text = text
	end
		
	def print
		puts "---- Pay #{@text}"
	end
end

class Warranty
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

def packing_slip(text)
	if Processor.instance.last_product
		Processor.instance.last_product.add_slip PS.new(text)
	else
		puts "Product was not defined"
	end
end

def mail(text)
	if Processor.instance.last_product
		Processor.instance.last_product.add_send Send.new(text)
	else
		puts "Product was not defined"
	end
end

def pay(text)
	if Processor.instance.last_product
		Processor.instance.last_product.add_payment Payment.new(text)
	else
		puts "Product was not defined"
	end
end

def addon(text)
	if Processor.instance.last_product
		Processor.instance.last_product.add_addon Addon.new(text)
	else
		puts "Product was not defined"
	end
end

def warranty(text)
	if Processor.instance.last_product
		Processor.instance.last_product.add_warranty Warranty.new(text)
	else
		puts "Product was not defined"
	end
end

def activate
	if Processor.instance.last_product
		Processor.instance.last_product.set_activate(true)
	else
		puts "Product was not defined"
	end
end

def printProcessor
	Processor.instance.print
end

def play
	str = ""
	while str != "quit"
		print "\nEnter Product Type or \'quit\' to end: "
		str = gets.chomp.downcase
		boo = false
		Processor.instance.getProducts.each do |i|
			if str == i.getName
				i.print
				boo = true
			end
		end
		if !boo && str != "quit"
			puts "Not a Valid Product"
		end
	end
end
