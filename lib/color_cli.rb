require "color_cli/version"
require "color_cli/color"
require 'optparse'


OPTS = {:output => "ALL"}

module ColorCli

	def self.create_option_parser
		op = OptionParser.new do |x|
		    x.banner = 'color converts rgb to hex and vice versa.'      
		    x.separator ''

		    x.on("-r", "--rgb red,green,blue,alpha", Array,  "Takes in a list of RGBa octals like 255, 255, 255 with an optional alpha value between 0.0 and 1.0.") do |rgb|
		    	OPTS[:color_input] = rgb  
		    end

		    x.on("-h", "--hex HEX", String,  "Takes in a six digit hex string (with or without the leading hash)") do |hex|
		    	OPTS[:color_input] = hex  
		    end

		    x.on("-o", "--output format", String,  "Output hex, rgb (octal or decimal), or all.") do |output|
		    	OPTS[:output] = output.upcase
		    end
		    
		    x.on("--help", "Show this message") do
		    	puts op;  
		    	exit 
		    end
		end
		
		return op
	end
	
	op = create_option_parser()

	op.parse!(ARGV)

	abort "Input a color! Use -h for a hex color or -r for RGB. Use --help for help." unless OPTS.has_key? :color_input
	color = Color.new(OPTS[:color_input])

	case OPTS[:output]
		when "RGB"
			puts "#{color.octal_rgb_value}"
		when "RGB OCTAL"
			puts "#{color.octal_rgb_value}"
		when "RGB DECIMAL"
			puts "#{color.float_rgb_value}"
		when "HEX"
			puts "#{color.hex_value}"
		else
			puts "HEX:          #{color.hex_value}"
			puts "RGBa Octal:   #{color.octal_rgb_value}"
			puts "RGBa Decimal: #{color.float_rgb_value}"
	end


end
