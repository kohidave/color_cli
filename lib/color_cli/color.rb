class Color

	RGB_VALUES_BETWEEN_0_AND_256_ERROR = "RGBa values must be either between 0.0 and 1.0 or 0 and 255."

	def initialize(color_representation)
		if color_representation.is_a? Array
			# It must be a RGBa value
			@colorCode = normalize_rgb_value(color_representation)
		else

		end
	end

	def normalize_rgb_value(color_representation)
		if color_representation.size < 3
			abort("RGB requires a red, green and blue value.")
		end

		if color_representation[0].is_a? Float
			color_representation.map! { |color_value| 
				if color_value.between?(0.0,1.0)
					 (color_value*255).to_i 
				else 
					abort(RGB_VALUES_BETWEEN_0_AND_256_ERROR)
				end
			}
		else 
			color_representation.each {|color_value| abort(RGB_VALUES_BETWEEN_0_AND_256_ERROR) unless color_value.between?(0,255)}
		end

		return color_representation
	end

end 