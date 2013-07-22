# ColorCli

A simple command line app for converting color values. 

## Usage

ColorCLI can convert any 6 character HEX, octal RGBa and decimal RGBa to one another. 

### Examples

Converting HEX values:

	› color FEFAFD
	HEX:          #FEFAFD
	RGBa Octal:   [254, 250, 253]
	RGBa Decimal: [0.996078431372549, 0.9803921568627451, 0.9921568627450981]

Converting octal RGB values:

	› color 254, 250, 253
	HEX:          #FEFAFD
	RGBa Octal:   [254, 250, 253, 1.0]
	RGBa Decimal: [0.996078431372549, 0.9803921568627451, 0.9921568627450981, 1.0]

Converting decimal RGB values:

	› color .5, .532, .53
	HEX:          #7F8787
	RGBa Octal:   [127, 135, 135, 1.0]
	RGBa Decimal: [0.4980392156862745, 0.5294117647058824, 0.5294117647058824, 1.0]

Adding in some alpha (this won't affect the HEX string):

	› color .5, .532, .53, .9
	HEX:          #7F8787
	RGBa Octal:   [127, 135, 135, 0.9]
	RGBa Decimal: [0.4980392156862745, 0.5294117647058824, 0.5294117647058824, 0.9]

Specifying an output format:

	› color 255, 255, 255 -o hex
	#FFFFFF