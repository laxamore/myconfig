local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local battery_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc") {
  show_current_level = true,
  timeout = 1,
}

local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness") {
  type = 'icon_and_text',
  percentage = true,
}

local pacman_widget = require('awesome-wm-widgets.pacman-widget.pacman') {
  polkit_agent_path = '/usr/bin/lxqt-policykit-agent',
}

local pipewire_widget = require("widgets.pipewire")

local bar = {}

local function centered_widget_layout(widget)
  local layout = wibox.layout.align.vertical()
  layout.expand = "none"
  layout:set_middle(widget)
  return layout
end

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

  -- set wibar opacity
  s.mywibox.opacity = 0.7
end

function bar:setup_widgets(s)
  -- wibox setup
  local container = wibox.container.background()
  container.bg = "#000000"

  local container_layout = wibox.layout.align:horizontal()

  local left_widgets = wibox.layout.fixed.horizontal()
  local middle_widgets = wibox.layout.fixed.horizontal()
  local right_widgets = wibox.layout.fixed.horizontal()

  -- left widgets
  left_widgets:set_spacing(10)
  left_widgets:add(wibox.widget.textbox(" "))
  left_widgets:add(awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = awful.button({}, 1, function(t) 
      local idx = t.index

      -- switch tag on focused screen
      local tag = awful.screen.focused().tags[idx]
      if tag then
        tag:view_only()
      end
    end),
  })

  -- middle widgets
  middle_widgets:set_spacing(10)
  middle_widgets:add(wibox.widget.textbox(" "))
  middle_widgets:add(centered_widget_layout(
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      {
        widget = awful.widget.tasklist {
          screen = s,
          filter = awful.widget.tasklist.filter.currenttags,
          style = {
            bg_focus = "#000000",
          },
          buttons = awful.button({}, 1, function(c)
            -- if task is already focused minimized the task
            if c == client.focus then
              c.minimized = true
            else
              -- otherwise, focus the task
              c:emit_signal("request::activate", "tasklist", { raise = true })
            end
          end)
        },
        forced_height = 20,
      }
    }))

  -- right widgets
  right_widgets:set_spacing(20)
  right_widgets:add(centered_widget_layout(
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      pacman_widget,
    }
  ))
  right_widgets:add(centered_widget_layout(
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      brightness_widget
    }
  ))
  right_widgets:add(centered_widget_layout(
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      battery_widget
    }
  ))
  right_widgets:add(centered_widget_layout(
    pipewire_widget()
  ))
  right_widgets:add(centered_widget_layout(
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      {
        widget = wibox.widget.textclock("%a %b %d %y - %H:%M:%S", 1),
      }
    }
  ))
  right_widgets:add(centered_widget_layout(
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      {
        widget = wibox.widget.systray(),
      },
      forced_height = 20,
    }
  ))

  container_layout:set_left(left_widgets)
  container_layout:set_middle(middle_widgets)
  container_layout:set_right(right_widgets)

  container:set_widget(container_layout)

  s.mywibox:set_widget(container)
end

return bar
