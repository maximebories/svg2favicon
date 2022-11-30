#!/bin/bash

# Convert svg image to favicon.ico and apple-touch-icon.png
# Usage: svg2favicon.sh <svg file> <output directory>
# Example: svg2favicon.sh favicon.svg /var/www/html

# Check if ImageMagick is installed
if ! [ -x "$(command -v convert)" ]; then
	echo 'Error: ImageMagick is not installed.' >&2
	if [ -x "$(command -v brew)" ]; then
		echo 'Trying to install ImageMagick with brew...' >&2
		brew install imagemagick
	else
		echo 'Please install ImageMagick.' >&2
		exit 1
	fi
fi

# Check if Inkscape is installed
if ! [ -x "$(command -v inkscape)" ]; then
	echo 'Error: Inkscape is not installed.' >&2
	if [ -x "$(command -v brew)" ]; then
		echo 'Trying to install Inkscape with brew...' >&2
		brew install inkscape
	else
		echo 'Please install Inkscape.' >&2
		exit 1
	fi
fi

# Check if svg file exists
if [ ! -f "$1" ]; then
	echo "Error: $1 does not exist." >&2
	exit 1
fi

# Check if output directory exists
if [ ! -d "$2" ]; then
	echo "Error: $2 does not exist." >&2
	exit 1
fi

# Create favicon.ico
inkscape -z -e "$2/favicon.ico" -w 32 -h 32 "$1"

# Create apple-touch-icon.png
convert "$1" -resize 180x180 "$2/apple-touch-icon.png"

# Create favicon-16x16.png

convert "$1" -resize 16x16 "$2/favicon-16x16.png"

# Create favicon-32x32.png

convert "$1" -resize 32x32 "$2/favicon-32x32.png"

# Create favicon-96x96.png

convert "$1" -resize 96x96 "$2/favicon-96x96.png"

# Create favicon-128x128.png

convert "$1" -resize 128x128 "$2/favicon-128x128.png"

# Create favicon-196x196.png

convert "$1" -resize 196x196 "$2/favicon-196x196.png"

# Create favicon-256x256.png

convert "$1" -resize 256x256 "$2/favicon-256x256.png"

# Create favicon-384x384.png

convert "$1" -resize 384x384 "$2/favicon-384x384.png"

# Create favicon-512x512.png

convert "$1" -resize 512x512 "$2/favicon-512x512.png"

# Create favicon-1024x1024.png

convert "$1" -resize 1024x1024 "$2/favicon-1024x1024.png"

# Add the following to the <head> section of your html file
echo "

Add the following code to the <head> section of your html file:

"
echo "<!-- Favicons -->
<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"$2/apple-touch-icon.png\">
<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"$2/favicon-32x32.png\">
<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"$2/favicon-16x16.png\">
<link rel=\"manifest\" href=\"$2/site.webmanifest\">
<link rel=\"mask-icon\" href=\"$2/safari-pinned-tab.svg\" color=\"#5bbad5\">
<link rel=\"shortcut icon\" href=\"$2/favicon.ico\">
<meta name=\"msapplication-TileColor\" content=\"#da532c\">
<meta name=\"msapplication-config\" content=\"$2/browserconfig.xml\">
<meta name=\"theme-color\" content=\"#ffffff\">

<!-- Favicons for Android -->
<link rel=\"icon\" sizes=\"36x36\" href=\"$2/favicon-36x36.png\">
<link rel=\"icon\" sizes=\"48x48\" href=\"$2/favicon-48x48.png\">
<link rel=\"icon\" sizes=\"72x72\" href=\"$2/favicon-72x72.png\">
<link rel=\"icon\" sizes=\"96x96\" href=\"$2/favicon-96x96.png\">
<link rel=\"icon\" sizes=\"144x144\" href=\"$2/favicon-144x144.png\">
<link rel=\"icon\" sizes=\"192x192\" href=\"$2/favicon-192x192.png\">
<link rel=\"icon\" sizes=\"256x256\" href=\"$2/favicon-256x256.png\">
<link rel=\"icon\" sizes=\"384x384\" href=\"$2/favicon-384x384.png\">
<link rel=\"icon\" sizes=\"512x512\" href=\"$2/favicon-512x512.png\">
<link rel=\"icon\" sizes=\"1024x1024\" href=\"$2/favicon-1024x1024.png\">

<!-- Favicons for iOS -->
<link rel=\"apple-touch-icon\" sizes=\"57x57\" href=\"$2/apple-touch-icon-57x57.png\">
<link rel=\"apple-touch-icon\" sizes=\"60x60\" href=\"$2/apple-touch-icon-60x60.png\">
<link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"$2/apple-touch-icon-72x72.png\">
<link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"$2/apple-touch-icon-76x76.png\">
<link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"$2/apple-touch-icon-114x114.png\">
<link rel=\"apple-touch-icon\" sizes=\"120x120\" href=\"$2/apple-touch-icon-120x120.png\">
<link rel=\"apple-touch-icon\" sizes=\"144x144\" href=\"$2/apple-touch-icon-144x144.png\">
<link rel=\"apple-touch-icon\" sizes=\"152x152\" href=\"$2/apple-touch-icon-152x152.png\">
<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"$2/apple-touch-icon-180x180.png\">"

# Add the following to site.webmanifest
echo "

Add the following code to your site.webmanifest file to use the generated images:

"
echo "{
  \"name\": \"\",
  \"short_name\": \"\",
  \"icons\": [
    {
      \"src\": \"$2/android-chrome-192x192.png\",
      \"sizes\": \"192x192\",
      \"type\": \"image/png\"
    },
    {
      \"src\": \"$2/android-chrome-512x512.png\",
      \"sizes\": \"512x512\",
      \"type\": \"image/png\"
    }
  ],
  \"theme_color\": \"#ffffff\",
  \"background_color\": \"#ffffff\",
  \"display\": \"standalone\"
}"

# Add the following to browserconfig.xml
echo "

Add the following code to your browserconfig.xml file to use the generated images:

"
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<browserconfig>
  <msapplication>
    <tile>
      <square70x70logo src=\"$2/smalltile.png\"/>
      <square150x150logo src=\"$2/mediumtile.png\"/>
      <square310x310logo src=\"$2/widetile.png\"/>
      <TileColor>#ffffff</TileColor>
    </tile>
  </msapplication>
</browserconfig>"

# Create smalltile.png
convert "$1" -resize 70x70 "$2/smalltile.png"

# Create mediumtile.png
convert "$1" -resize 150x150 "$2/mediumtile.png"

# Create widetile.png
convert "$1" -resize 310x310 "$2/widetile.png"

# Create safari-pinned-tab.svg
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" viewBox=\"0 0 16 16\">
  <g fill=\"$3\">
    <rect width=\"16\" height=\"16\" rx=\"3\"/>
  </g>
</svg>" >"$2/safari-pinned-tab.svg"

echo "

Done."

# Exit with success
exit 0

# End of file
