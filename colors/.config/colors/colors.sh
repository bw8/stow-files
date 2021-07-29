# Shell variables
wallpaper="$HOME/imgs/walls/the_neon_shallows.png"

# Special
foreground='#c0c1c1'
background='#0B1118'
cursor='#2CFEA3'

# Colors
    # black
color0='#0b1118'
color8='#424547'
    # red
color1='#c51729'    
color9='#f71c33'
    # green
color2='#227b4b'
color10='#2EA564'
    # yellow
color3='#b96e37'
color11='#F7934A'
    # blue
color4='#701f24'
color12='#962A30'
    # purple
color5='#0f5737'
color13='#126d45'
    # cyan
color6='#3eab84'
color14='#50ddaa'
    # white
color7='#818384'
color15='#c0c1c1'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
        --color fg:7,bg:0,hl:2,fg+:15,bg+:4,hl+:0
        --color info:10,prompt:10,spinner:1,pointer:0,marker:4
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"
