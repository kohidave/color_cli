require "color_cli/version"
require "color_cli/color"
require 'optparse'


OPTS = {:output => "ALL"}

module ColorCli
	
		def self.create_option_parser
		op = OptionParser.new do |x|
		    x.banner = 'color converts rgb to hex and vice versa.'      
		    x.separator ''

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

	def self.parse_color_option args
		if args.size > 1
			return args.map{|value| value.delete ','}
		elsif args.size == 1
			if args[0].count(',') > 0
				parse_color_option args[0].split(',')
			else 
				return String.new args[0]
			end
		else
			abort "Bad input. Enter a RGBa or HEX value."
		end
	end

	op = create_option_parser()

	op.parse!(ARGV)

	if ARGV.size == 0 then abort "Input a color! Possible ussages: 'color FFFFFF', 'color 255, 255, 255', 'color .75, .75, .75, .1' --help for aditional options " end

	color = Color.new(parse_color_option(ARGV))

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
