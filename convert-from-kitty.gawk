#!/usr/bin/env gawk -f

/^#/ && $2 != "vim:ft=kitty" { print }
/^$/ { print }
$1 == "foreground" { print "foreground = "$2 } 
$1 == "background" { background = $2; print "background = "$2 } 
$1 == "cursor" { print "cursor-color ="$2 }
$1 == "cursor_text_color" && $2 == "background"{ print "cursor-text ="background }
$1 == "cursor_text_color" && $2 ~ /#[a-fA-F0-9]+/ { print "cursor-text ="$2 }
$1 == "selection_foreground" { print "selection-foreground = "$2 } 
$1 == "selection_background" { print "selection-background = "$2 } 
match($1, /color([0-9]+)/, m) { print "palette = "m[1]"="$2 }
