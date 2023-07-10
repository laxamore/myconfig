local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local pipewire_module = require("widgets.pipewire.pipewire_module")

local pipewire_widget = { mt = {} }

-- Color constants
local MUTED_COLOR = "#707880"
local UNMUTED_COLOR = "#F0C674"

local function new(args)
  local w = wibox.widget {
    layout = wibox.layout.fixed.horizontal,
    {
      id = "textbox",
      widget = wibox.widget.textbox,
    }
  }

  gears.table.crush(w, pipewire_widget, true)

  local buttons_binding = gears.table.join(
  -- left click to toggle mute
    awful.button({}, 1, function() pipewire_module:toggle_default_sink_mute() end),
    -- scroll up to increase volume
    awful.button({}, 4, function() pipewire_module:increase_default_sink_volume(1) end),
    -- scroll down to decrease volume
    awful.button({}, 5, function() pipewire_module:decrease_default_sink_volume(1) end)
  )

  w:buttons(buttons_binding)

  -- spawn update loop
  gears.timer {
    timeout = 0.1,
    autostart = true,
    callback = function()
      local state = {
        muted = pipewire_module:get_default_sink_mute(),
        volume = pipewire_module:get_default_sink_volume()
      }

      w.textbox:set_markup_silently(
        string.format(
          "<span foreground='%s'>%01d%%</span>",
          state.muted and MUTED_COLOR or UNMUTED_COLOR,
          state.volume
        )
      )
    end
  }

  return w
end

function pipewire_widget.mt:__call(...)
  return new(...)
end

return setmetatable(pipewire_widget, pipewire_widget.mt)