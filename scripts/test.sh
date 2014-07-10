#/bin/bash
base_path=AppIcon60x60@2x.png

width=`identify -format %w ${base_path}`
badge_width=$(((800 * $width) / 1200))

convert -size ${badge_width}x8 xc:skyblue -fill grey15 -draw "rectangle 0,0,$badge_width,8" bar1.png
convert -size ${badge_width}x8 xc:skyblue -fill gold2 -draw "rectangle 0,0,$badge_width,8" bar2.png
convert bar1.png bar2.png bar1.png bar2.png bar1.png bar2.png bar1.png bar2.png bar1.png bar2.png -append bars.png
convert bars.png -matte -virtual-pixel Transparent -affine 0.707107,0.707107,-0.707107,0.707107,0.000000,0.000000 -transform +repage bars2.png

bagde_width2=`identify -format %w bars2.png`
h=$(($bagde_width2 / 2))
w=$(($width - $h))

convert AppIcon60x60\@2x.png bars2.png -geometry +${w}-${h} -composite final.png 