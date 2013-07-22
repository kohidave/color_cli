class Color

	RGB_VALUES_BETWEEN_0_AND_256_ERROR = "RGBa values must be either between 0.0 and 1.0 or 0 and 255."
	HEX_VALUES_BETWEEN_00_AND_FF_ERROR = "HEX values must be between 00 and FF."
	def initialize(color_representation)
		if color_representation.is_a? Array
			# It must be a RGBa value
			@colorCode = normalize_rgb_value color_representation
		else
			@colorCode = normalize_hex_value color_representation
		end
	end

	def normalize_rgb_value(rgb_color_representation)
		if rgb_color_representation.size < 3
			abort("RGB requires a red, green and blue value.")
		end

		alpha = if rgb_color_representation.size > 3 then rgb_color_representation[3].to_f else 1.0 end
		abort("Alpha value must be between 0.0 and 1.0") unless alpha.between?(0.0,1.0)

		rgb_color_representation = rgb_color_representation[0..2]

		# Convert from String to int or float list
		 case rgb_color_representation[0].count '.'
			 when 0
			 	rgb_color_representation = rgb_color_representation[0..2].map {|string_number| Integer(string_number)}
			 when 1
			 	rgb_color_representation.map! {|string_number| Float(string_number)}
			 else
			 	abort "That's not a number..."
		 end

		if rgb_color_representation[0].is_a? Float
			rgb_color_representation.map! { |color_value| 
				if color_value.between?(0.0,1.0)
					 (color_value*255).to_i 
				else 
					abort(RGB_VALUES_BETWEEN_0_AND_256_ERROR)
				end
			}
		else 
			rgb_color_representation.each {|color_value| abort(RGB_VALUES_BETWEEN_0_AND_256_ERROR) unless color_value.between?(0,255)}
		end

		rgb_color_representation.push(alpha)

		return rgb_color_representation
	end

	def normalize_hex_value(hex_color_representation)
		hex_color_representation.delete! "#"
		abort("Please enter a valid, 6 character, HEX string (with or without the hash).") unless hex_color_representation.size == 6
		rgb_color_representation = [hex_color_representation[0..1], hex_color_representation[2..3], hex_color_representation[4..5]]
		rgb_color_representation.map!{|hex| hex.to_i(16)}
		rgb_color_representation.each{|color_value| abort(HEX_VALUES_BETWEEN_00_AND_FF_ERROR) unless color_value.between?(0,255)}
		return rgb_color_representation
	end

	def hex_value
		return "#%02X%02X%02X" % [@colorCode[0], @colorCode[1], @colorCode[2]]
	end

	def octal_rgb_value
		return Array.new @colorCode
	end

	def float_rgb_value
		float_rgb = @colorCode[0..2].map { |color_value| color_value/255.0 }
		float_rgb.push @colorCode[3] unless @colorCode[3].nil? 
		return float_rgb
	end
end 