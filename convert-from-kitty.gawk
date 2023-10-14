#!/usr/bin/env gawk -f

/^#/ && $2 != "vim:ft=kitty" { print }
/^$/ { print }
$1 == "foreground" && $2 ~ /#[a-fA-F0-9]+/ { print "foreground = "$2 } 
$1 == "background" && $2 ~ /#[a-fA-F0-9]+/ { background = $2; print "background = "$2 } 
$1 == "cursor" && $2 ~ /#[a-fA-F0-9]+/ { print "cursor-color ="$2 }
$1 == "cursor_text_color" && $2 == "background"{ print "cursor-text ="background }
$1 == "cursor_text_color" && $2 ~ /#[a-fA-F0-9]+/ { print "cursor-text ="$2 }
$1 == "selection_foreground" && $2 ~ /#[a-fA-F0-9]+/ { print "selection-foreground = "$2 } 
$1 == "selection_background" && $2 ~ /#[a-fA-F0-9]+/ { print "selection-background = "$2 } 
match($1, /color([0-9]+)/, m) { print "palette = "m[1]"="$2 }
