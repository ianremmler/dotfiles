require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("obvious.battery")
require("debian.menu")

beautiful.init(awful.util.getdir("config") .. "/themes/wonko/theme.lua")

winmenu_width  = 512
num_tags       = 9
terminal       = "roxterm"
browser        = "firefox"
video_autoconf = "xrandr --auto"
fancy_run      = "gmrun"

awful.menu.menu_keys.up    = { "k", "Up"              }
awful.menu.menu_keys.down  = { "j", "Down", "Tab"     }
awful.menu.menu_keys.back  = { "h", "Left"            }
awful.menu.menu_keys.exec  = { "l", "Right", "Return" }
awful.menu.menu_keys.close = { "Escape"               }

W = "Mod4"
S = "Shift"
C = "Control"

keys = {
    global_select_tag     = { { W       },               },
    global_move_win       = { { W, S    },               },
    global_toggle_tag     = { { W, C    },               },
    global_toggle_win     = { { W, C, S },               },
    global_prev_tag       = { { W       }, "h"           },
    global_next_tag       = { { W       }, "l"           },
    global_last_tag       = { { W       }, "o"           },
    global_prev_win       = { { W       }, "k"           },
    global_next_win       = { { W       }, "j"           },
    global_main_menu      = { { W       }, "m"           },
    global_run            = { { W,      }, "space"       },
    global_fancy_run      = { { W, C    }, "space"       },
    global_run_lua        = { { W, S    }, "space"       },
    global_swap_prev      = { { W, S    }, "k"           },
    global_swap_next      = { { W, S    }, "j"           },
    global_goto_last      = { { W       }, "'"           },
    global_goto_master    = { { W       }, ";"           },
    global_run_terminal   = { { W       }, "Return"      },
    global_run_browser    = { { W, C    }, "Return"      },
    global_quit           = { { W, C    }, "BackSpace"   },
    global_restart        = { { W, S    }, "BackSpace"   },
    global_grow_master    = { { W, C    }, "l"           },
    global_shrink_master  = { { W, C    }, "h"           },
    global_inc_masters    = { { W       }, "]"           },
    global_dec_masters    = { { W       }, "["           },
    global_inc_cols       = { { W, C    }, "]"           },
    global_dec_cols       = { { W, C    }, "["           },
    global_vert_tile      = { { W       }, ","           },
    global_horiz_tile     = { { W       }, "."           },
    global_float          = { { W       }, "/"           },
    global_reset_geom     = { { W       }, "0"           },
    global_toggle_panel   = { { W       }, "`"           },
    global_win_menu       = { { W       }, "Tab"         },
    global_goto_urgent    = { { W       }, "u"           },
    global_video_autoconf = { {         }, "XF86Display" },
    global_prev_screen    = { { W       }, "p"           },
    global_next_screen    = { { W       }, "n"           },
    win_close             = { { W       }, "BackSpace"   },
    win_toggle_float      = { { W       }, "\\"          },
    win_toggle_max        = { { W       }, "="           },
    win_toggle_min        = { { W       }, "-"           },
    win_swap_master       = { { W, S    }, ";"           },
    win_prev_screen       = { { W, S    }, "p"           },
    win_next_screen       = { { W, S    }, "n"           },
    win_grow              = { { W, C    }, "k"           },
    win_shrink            = { { W, C    }, "j"           },
}

buttons = {
    tag_select           = { {      }, 1 },
    tag_move_win         = { { S    }, 1 },
    tag_toggle_win       = { {      }, 2 },
    tag_toggle_shown     = { {      }, 3 },
    tag_prev             = { {      }, 4 },
    tag_next             = { {      }, 5 },
    winlist_select       = { {      }, 1 },
    winlist_toggle_max   = { { C    }, 1 },
    winlist_toggle_float = { {      }, 2 },
    winlist_close        = { { C    }, 2 },
    winlist_menu         = { {      }, 3 },
    winlist_toggle_min   = { { C    }, 3 },
    winlist_prev         = { {      }, 4 },
    winlist_next         = { {      }, 5 },
    layout_prev_click    = { {      }, 3 },
    layout_prev_scroll   = { {      }, 4 },
    layout_next_click    = { {      }, 1 },
    layout_next_scroll   = { {      }, 5 },
    desk_main_menu       = { {      }, 3 },
    desk_prev_tag        = { {      }, 4 },
    desk_next_tag        = { {      }, 5 },
    win_select           = { {      }, 1 },
    win_move             = { { W    }, 1 },
    win_close            = { { W, C }, 2 },
    win_resize           = { { W    }, 3 },
    win_toggle_float     = { { W    }, 2 },
    win_toggle_max       = { { W, C }, 1 },
    win_toggle_min       = { { W, C }, 3 },
}

config_menu = {
    { "audio", "pavucontrol" },
    { "video", "arandr"      },
}

awesome_menu = {
    { "restart", awesome.restart },
    { "quit",    awesome.quit    },
}

main_menu = awful.menu({
    items = {
        { "terminal", terminal                       },
        { "browser",  browser                        },
        { "config",   config_menu                    },
        { "debian",   debian.menu.Debian_menu.Debian },
        { "awesome",  awesome_menu                   },
    }
})

layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
}

tag_ids = {}
for i = 1, num_tags do tag_ids[i] = i end
tags = {}
for s = 1, screen.count() do tags[s] = awful.tag(tag_ids, s, layouts[1]) end

launcher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = main_menu, })
clock = awful.widget.textclock({ align = "right" }, "%F %H:%M")
battery = obvious.battery()
systray = widget({ type = "systray" })
wibox = {}
prompt = {}
layout = {}
taglist = {}
winlist = {}

function key(name, func, key)
    key = key or keys[name][2]
    return awful.key(keys[name][1], key, func)
end

function button(name, func)
    return awful.button(buttons[name][1], buttons[name][2], func)
end

taglist.buttons = awful.util.table.join(
    button("tag_select", awful.tag.viewonly),
    button("tag_toggle_win", awful.client.toggletag),
    button("tag_move_win", awful.client.movetotag),
    button("tag_toggle_shown", awful.tag.viewtoggle),
    button("tag_prev", awful.tag.viewprev),
    button("tag_next", awful.tag.viewnext)
)

winlist.buttons = awful.util.table.join(
    button("winlist_select", function(c)
        if not c:isvisible() then awful.tag.viewonly(c:tags()[1]) end
        client.focus = c
        c:raise()
    end),
    button("winlist_toggle_max", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c.maximized_horizontal = not c.maximized_horizontal
    end),
    button("winlist_toggle_float", awful.client.floating.toggle),
    button("winlist_close", function(c) c:kill() end),
    button("winlist_menu", function()
        if winmenu then
            winmenu:hide()
            winmenu = nil
        else
            winmenu = awful.menu.clients({ width = winmenu_width }, { keygrabber = true })
        end
    end),
    button("winlist_toggle_min", function(c) c.minimized = not c.minimized end),
    button("winlist_prev", function()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end),
    button("winlist_next", function()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
    end)
)

for s = 1, screen.count() do
    prompt[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    layout[s] = awful.widget.layoutbox(s)
    layout[s]:buttons(awful.util.table.join(
        button("layout_prev_click", function() awful.layout.inc(layouts, -1) end),
        button("layout_next_click", function() awful.layout.inc(layouts, 1) end),
        button("layout_prev_scroll", function() awful.layout.inc(layouts, -1) end),
        button("layout_next_scroll", function() awful.layout.inc(layouts, 1) end)
    ))
    taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)
    winlist[s] = awful.widget.tasklist(
        function(c) return awful.widget.tasklist.label.currenttags(c, s) end,
        winlist.buttons
    )
    wibox[s] = awful.wibox({ position = "top", screen = s })
    wibox[s].widgets = {
        {
            launcher,
            taglist[s],
            prompt[s],
            layout = awful.widget.layout.horizontal.leftright,
        },
        layout[s],
        clock,
        battery,
        s == 1 and systray or nil,
        winlist[s],
        layout = awful.widget.layout.horizontal.rightleft,
    }
    awful.widget.layout.margins[clock] = { right = 8 }
    awful.widget.layout.margins[battery] = { left = 8, right = 8 }
end

global_keys = awful.util.table.join(
    key("global_prev_tag", awful.tag.viewprev),
    key("global_next_tag", awful.tag.viewnext),
    key("global_last_tag", awful.tag.history.restore),
    key("global_prev_win", function()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end),
    key("global_next_win", function()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
    end),
    key("global_main_menu", function()
        main_menu:show({ keygrabber = true, coords = { x = 0, y = 0 } })
    end),
    key("global_swap_prev", function() awful.client.swap.byidx(-1) end),
    key("global_swap_next", function() awful.client.swap.byidx(1) end),
    key("global_goto_urgent", awful.client.urgent.jumpto),
    key("global_goto_last", function()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end),
    key("global_goto_master", function() client.focus = awful.client.getmaster() end),
    key("global_run_terminal", function() awful.util.spawn(terminal) end),
    key("global_run_browser", function() awful.util.spawn(browser) end),
    key("global_restart", awesome.restart),
    key("global_quit", awesome.quit),
    key("global_grow_master", function() awful.tag.incmwfact(0.05) end),
    key("global_shrink_master", function() awful.tag.incmwfact(-0.05) end),
    key("global_inc_masters", function() awful.tag.incnmaster(1) end),
    key("global_dec_masters", function() awful.tag.incnmaster(-1) end),
    key("global_inc_cols", function() awful.tag.incncol(1) end),
    key("global_dec_cols", function() awful.tag.incncol(-1) end),
    key("global_vert_tile", function() awful.layout.set(layouts[1]) end),
    key("global_horiz_tile", function() awful.layout.set(layouts[2]) end),
    key("global_float", function() awful.layout.set(layouts[3]) end),
    key("global_run", function() prompt[mouse.screen]:run() end),
    key("global_fancy_run", function() awful.util.spawn(fancy_run) end),
    key("global_run_lua", function()
        awful.prompt.run(
            { prompt = "Lua: " },
            prompt[mouse.screen].widget,
            awful.util.eval,
            nil,
            awful.util.getdir("cache") .. "/history_eval"
        )
    end),
    key("global_reset_geom", function()
        awful.tag.setnmaster(1)
        awful.tag.setncol(1)
        awful.tag.setmwfact(0.5)
        awful.tag.getdata(awful.tag.selected()).windowfact = {}
    end),
    key("global_toggle_panel", function()
        for s = 1, screen.count() do wibox[s].visible = not wibox[s].visible end
    end),
    key("global_win_menu", function ()
        awful.menu.clients(
            { width = winmenu_width },
            { keygrabber = true, coords = { x = 0, y = 0 } }
        )
    end),
    key("global_video_autoconf", function() awful.util.spawn(video_autoconf) end),
    key("global_prev_screen", function () awful.screen.focus_relative(-1) end),
    key("global_next_screen", function () awful.screen.focus_relative(1) end)
)

num_tag_keys = 0
for s = 1, screen.count() do num_tag_keys = math.min(9, math.max(#tags[s], num_tag_keys)) end

for i = 1, num_tag_keys do
    key_name = "#" .. i + 9
    global_keys = awful.util.table.join(
        global_keys,
        key("global_select_tag", function()
            screen = mouse.screen
            if tags[screen][i] then awful.tag.viewonly(tags[screen][i]) end
        end, key_name),
        key("global_toggle_tag", function()
            screen = mouse.screen
            if tags[screen][i] then awful.tag.viewtoggle(tags[screen][i]) end
        end, key_name),
        key("global_move_win", function()
            if client.focus and tags[client.focus.screen][i] then
                awful.client.movetotag(tags[client.focus.screen][i])
            end
        end, key_name),
        key("global_toggle_win", function()
            if client.focus and tags[client.focus.screen][i] then
                awful.client.toggletag(tags[client.focus.screen][i])
            end
        end, key_name)
    )
end

global_buttons = awful.util.table.join(
    button("desk_main_menu", function() main_menu:toggle() end),
    button("desk_prev_tag", awful.tag.viewprev),
    button("desk_next_tag", awful.tag.viewnext)
)

root.keys(global_keys)
root.buttons(global_buttons)

client_keys = awful.util.table.join(
    key("win_close", function(c) c:kill() end),
    key("win_toggle_float", awful.client.floating.toggle),
    key("win_toggle_max", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c.maximized_horizontal = not c.maximized_horizontal
    end),
    key("win_toggle_min", function(c) c.minimized = not c.minimized end),
    key("win_swap_master", function(c) c:swap(awful.client.getmaster()) end),
    key("win_prev_screen", function(c) awful.client.movetoscreen(c, c.screen - 1) end),
    key("win_next_screen", function(c) awful.client.movetoscreen(c, c.screen + 1) end),
    key("win_grow", function(c) awful.client.incwfact(0.05, c) end),
    key("win_shrink", function(c) awful.client.incwfact(-0.05, c) end)
)

client_buttons = awful.util.table.join(
    button("win_select", function(c)
        client.focus = c
        c:raise()
    end),
    button("win_move", awful.mouse.client.move),
    button("win_close", function(c) c:kill() end),
    button("win_resize", awful.mouse.client.resize),
    button("win_toggle_max", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c.maximized_horizontal = not c.maximized_horizontal
    end),
    button("win_toggle_min", function(c) c.minimized = not c.minimized end),
    button("win_toggle_float", awful.client.floating.toggle)
)

awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width     = beautiful.border_width,
            border_color     = beautiful.border_normal,
            focus            = true,
            keys             = client_keys,
            buttons          = client_buttons,
            size_hints_honor = false,
        }
    },
    { rule = { class    = "MPlayer"          }, properties = { floating = true } },
    { rule = { class    = "pinentry"         }, properties = { floating = true } },
    { rule = { instance = "plugin-container" }, properties = { floating = true } },
}

client.add_signal("manage", function(c, startup)
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier and
            awful.client.focus.filter(c)
        then
            client.focus = c
        end
    end)
    if not startup then
        awful.client.setslave(c)
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
