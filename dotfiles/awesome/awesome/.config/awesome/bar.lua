local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local pipewire_widget = require("widgets.pipewire")

local bar = {}

function bar:create_bar(s)
  local x_offset = 20
  local y_offset = 10

  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    height = 30,
    width = s.geometry.width - (x_offset * 2),
    border_width = 5,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 40)
    end
  })

  -- offset bar y position
  s.mywibox.y = s.geometry.y + y_offset
end

function bar:setup_widgets(s)
  -- wibox setup
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    expand = "none",
    -- left widgets
    {
      layout = wibox.layout.fixed.horizontal,
      spacing = 10,
      {
        widget = wibox.widget.textbox,
        text = " "
      },
      awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
      },
    },
    -- middle widgets
    {
      layout = wibox.layout.fixed.horizontal

    },
    -- right widgets
    {
      layout = wibox.layout.fixed.horizontal,
      spacing = 5,
      pipewire_widget(),
      {
        layout = wibox.layout.fixed.vertical,
        {
          widget = wibox.widget.textbox,
          forced_height = 5,
        },
        {
          widget = wibox.widget.systray(),
          forced_height = 21,
        }
      },
    },
  }
end

return bar
