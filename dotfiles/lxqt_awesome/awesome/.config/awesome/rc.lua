-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
require("awful.autofocus")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

local startup = require("startup")
local keys = require("keys")
local mouse = require("mouse")
local screens = require("screens")

client = client
screen = screen
awesome = awesome
root = root

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}

-- Startup commands
startup:init()

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(
    os.getenv("HOME") .. "/.config/awesome/theme.lua"
)
--- Gap / spacing between windows
beautiful.useless_gap = 10

-- Initialize screen
screens:init()

-- Default modkey.
local modkey = "Mod4" -- Super key

-- Global keybindings
root.keys(keys:get_globalkeys(modkey))

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys:get_clientkeys(modkey),
            buttons = mouse:get_clientbuttons(modkey),
            screen = awful.screen.focused,
        }
    },
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
            }
        }
    },
    {
        rule = { class = "Firefox" },
        properties = { screen = 1, tag = "2" }
    },
}
-- }}}

-- {{{ Signals
-- Signal callback when a client goes floating or back to normal
client.connect_signal("property::floating", function(c)
    if c.floating and not c.fullscreen then
        c.above = true
        c.below = false
    elseif not c.floating and not c.fullscreen then
        c.above = false
        c.below = true
    end
end)

-- Signal callback when a client goes fullscreen or back to normal
client.connect_signal("property::fullscreen", function(c)
    -- By default a fullscreen client is always on top if the other clients ontop state is not true
    -- But somehow when client fullscreen ontop or below is set to true, it will not goes into fullscreen
    -- So avoid by not setting ontop or below to true

    -- if client goes back into floating mode, set it to above any tiled clients
    if c.floating and not c.fullscreen then
        c.above = true
        c.below = false
        -- if client goes into tiled mode, set it to below any floating clients
    elseif not c.floating and not c.fullscreen then
        c.above = false
        c.below = true
    end
end)

-- Prevent any client to be maximized
client.connect_signal("property::maximized", function(c)
    if c.maximized then
        c.maximized = false
    end
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    -- prevent new clients to be maximized or fullscreen
    c.maximized_horizontal = false
    c.maximized_vertical   = false
    c.maximized            = false
    c.fullscreen           = false

    if c.floating and not c.fullscreen then
        c.above = true
        c.below = false
    end

    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    -- set new clients to slave
    if not awesome.startup then
        awful.client.setslave(c)
    end

    -- round corners
    c.shape = gears.shape.rounded_rect
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
-- }}}

-- Run garbage collector regularly to prevent memory leaks
gears.timer {
    timeout = 30,
    autostart = true,
    callback = function() collectgarbage() end
}
