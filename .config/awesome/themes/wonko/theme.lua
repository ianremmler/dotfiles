require("awful")

theme = {}

theme.dir                    = awful.util.getdir("config") .. "/themes/wonko"
theme.wallpaper_cmd          = { "xsetroot -fg black -bg gray12 -mod 16 16" }
theme.font                   = "Inconsolata bold 11"
theme.fg_focus               = "black"
theme.bg_focus               = "gray75"
theme.fg_normal              = "gray75"
theme.bg_normal              = "gray25"
theme.fg_urgent              = "black"
theme.bg_urgent              = "red"
theme.border_width           = "2"
theme.border_focus           = "gray75"
theme.border_normal          = "gray25"
theme.border_marked          = "blue"
theme.titlebar_bg_focus      = "gray75"
theme.titlebar_bg_normal     = "gray25"
theme.menu_height            = "24"
theme.menu_width             = "256"
theme.taglist_squares_sel    = theme.dir .. "/tag_sel.png"
theme.taglist_squares_unsel  = theme.dir .. "/tag_unsel.png"
theme.awesome_icon           = theme.dir .. "/arrow.png"
theme.menu_submenu_icon      = theme.dir .. "/arrow.png"
theme.tasklist_floating_icon = theme.dir .. "/float.png"
theme.layout_tile            = theme.dir .. "/tile.png"
theme.layout_tilebottom      = theme.dir .. "/tile_bottom.png"
theme.layout_max             = theme.dir .. "/max.png"

return theme
