local awful = require("awful")

local bar = require("bar")

local screens = {}

function screens:init()
    -- Table of layouts to cover with awful.layout.inc, order matters.
    awful.layout.layouts = {
        awful.layout.suit.tile,
    }

    local function set_wallpaper(s)
        awful.spawn.with_shell("feh --bg-fill ~/Pictures/Wallpapers/*")
    end

    -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)

    screen.connect_signal("property::geometry", set_wallpaper)
    awful.screen.connect_for_each_screen(function(s)
        -- Wallpaper
        set_wallpaper(s)

        -- Each screen has its own tag / workspace table.
        awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])

        -- Create the wibox / bar for each screen
        bar:create_bar(s)
        -- Add widgets to the wibox
        bar:setup_widgets(s)

    end)
end

return screens