require "color_cli/version"
require "color_cli/color"
require 'optparse'


OPTS = {}

module ColorCli

	def self.create_option_parser
		op = OptionParser.new do |x|
		    x.banner = 'color converts rgb to hex and vice versa.'      
		    x.separator ''
		    x.on("-h", "--help", "Show this message") do
		    	puts op;  
		    	exit 
		    end
		end
		
		return op
	end

	puts "Hello!"
	
	op = create_option_parser()

	op.parse!(ARGV)

end
