local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

local default_app = require("default_app")

local keys = {}
local last_view_tag = 2
local current_tag = 1

local function get_screen(s)
  return s and screen[s]
end

local function global_move_client_bydir(dir, sel)
  sel = sel or client.focus

  if sel then
    -- move focus
    awful.client.focus.global_bydirection(dir)
    local c = client.focus

    -- move inside a screen
    if get_screen(sel.screen) == get_screen(c.screen) and sel ~= c then
      sel:swap(c)
      client.focus = sel
    else
      sel:move_to_screen(awful.screen.focused())
      client.focus = sel
    end
  end
end

function keys:get_globalkeys(modkey)
  -- Layout keys bindings
  local globalkeys = gears.table.join(
  -- Increase width factor
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incmwfact(0.05) end,
      { description = "increase width factor", group = "layout" }),
    -- Decrease width factor
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incmwfact(-0.05) end,
      { description = "decrease width factor", group = "layout" }),
    -- Increase height factor
    awful.key({ modkey, "Control" }, "k", function() awful.client.incwfact(0.05) end,
      { description = "increase height factor", group = "layout" }),
    -- Decrease height factor
    awful.key({ modkey, "Control" }, "j", function() awful.client.incwfact(-0.05) end,
      { description = "decrease height factor", group = "layout" }),

    -- Switch layout to maximized
    awful.key({ modkey, "Shift" }, "f", function() awful.layout.set(awful.layout.suit.max) end,
      { description = "set layout to maximized", group = "layout" }),
    -- Switch layout to tiled
    awful.key({ modkey, "Shift" }, "t", function() awful.layout.set(awful.layout.suit.tile) end,
      { description = "set layout to tiled", group = "layout" })
  )

  -- Screen keys bindings
  globalkeys = gears.table.join(globalkeys,
    -- Switch focus to the left screen
    awful.key({ modkey, }, "a", function() awful.screen.focus_bydirection("left") end,
      { description = "focus to the left screen", group = "screen" }),
    -- Switch focus to the right screen
    awful.key({ modkey, }, "d", function() awful.screen.focus_bydirection("right") end,
      { description = "focus to the right screen", group = "screen" }),
    -- Switch focus to the top screen
    awful.key({ modkey, }, "w", function() awful.screen.focus_bydirection("up") end,
      { description = "focus to the top screen", group = "screen" }),
    -- Switch focus to the bottom screen
    awful.key({ modkey, }, "s", function() awful.screen.focus_bydirection("down") end,
      { description = "focus to the bottom screen", group = "screen" })
  )

  -- Tags / workspaces keys bindings
  globalkeys = gears.table.join(globalkeys,
    -- Toggle last viewed tag
    awful.key({ modkey, }, "`", function()
        for s in screen do
          local tag = s.tags[last_view_tag]
          if tag then
            tag:view_only()
          end
        end
        local temp = last_view_tag
        last_view_tag = current_tag
        current_tag = temp
      end,
      { description = "toggle last view tag", group = "tag" })
  )

  -- Launcher keys bindings
  globalkeys = gears.table.join(globalkeys,
    -- Terminal
    awful.key({ modkey, "Shift" }, "Return", function() awful.spawn(default_app.terminal) end,
      { description = "open a terminal", group = "launcher" }),

    -- Menubar
    awful.key({ modkey }, "p", function() awful.spawn(default_app.menubar) end,
      { description = "show the rofi menubar", group = "launcher" }),

    -- File manager
    awful.key({ modkey }, "e", function() awful.spawn(default_app.file_manager) end,
      { description = "open file manager", group = "launcher" })
  )

  -- System keys bindings
  globalkeys = gears.table.join(globalkeys,
    awful.key({ modkey, }, "q", awesome.restart,
      { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
      { description = "quit awesome", group = "awesome" })
  )

  -- Bind all key numbers to tags.
  -- Be careful: we use keycodes to make it work on any keyboard layout.
  -- This should map on the top row of your keyboard, usually 1 to 9.
  for i = 1, 5 do
    globalkeys = gears.table.join(globalkeys,
      -- View tag.
      awful.key({ modkey }, "#" .. i + 9,
        function()
          for s in screen do
            local tag = s.tags[i]
            if tag then
              tag:view_only()
            end
          end
          last_view_tag = current_tag
          current_tag = i
        end,
        { description = "view tag #" .. i, group = "tag" }),
      -- Move client to tag.
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        { description = "move focused client to tag #" .. i, group = "tag" })
    )
  end

  return globalkeys
end

function keys:get_clientkeys(modkey)
  local clientkeys = gears.table.join(
    awful.key({ modkey, }, "f",
      function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
      { description = "close", group = "client" }),
    awful.key({ modkey, "Shift" }, "space", awful.client.floating.toggle,
      { description = "toggle floating", group = "client" }),

    -- Switch focus to the left
    awful.key({ modkey, }, "h", function() awful.client.focus.global_bydirection("left") end,
      { description = "focus next client to the left", group = "client" }),
    awful.key({ modkey, }, "Left", function() awful.client.focus.global_bydirection("left") end,
      { description = "focus next client to the left", group = "client" }),
    -- Switch focus to the right
    awful.key({ modkey, }, "l", function() awful.client.focus.global_bydirection("right") end,
      { description = "focus next client to the right", group = "client" }),
    awful.key({ modkey, }, "Right", function() awful.client.focus.global_bydirection("right") end,
      { description = "focus next client to the right", group = "client" }),
    -- Switch focus to the top
    awful.key({ modkey, }, "k", function() awful.client.focus.global_bydirection("up") end,
      { description = "focus next client to the up", group = "client" }),
    awful.key({ modkey, }, "Up", function() awful.client.focus.global_bydirection("up") end,
      { description = "focus next client to the up", group = "client" }),
    -- Switch focus to the bottom
    awful.key({ modkey, }, "j", function() awful.client.focus.global_bydirection("down") end,
      { description = "focus next client to the bottom", group = "client" }),
    awful.key({ modkey, }, "Down", function() awful.client.focus.global_bydirection("down") end,
      { description = "focus next client to the bottom", group = "client" }),

    -- Switch focus to next client
    awful.key({ modkey, }, "Tab", function() awful.client.focus.byidx(1) end,
      { description = "focus next client", group = "client" }),
    -- Switch focus to previous client
    awful.key({ modkey, "Shift" }, "Tab", function() awful.client.focus.byidx(-1) end,
      { description = "focus previous client", group = "client" }),

    -- Move clients to the left
    awful.key({ modkey, "Shift" }, "h", function() global_move_client_bydir("left") end,
      { description = "move client to the left", group = "client" }),
    awful.key({ modkey, "Shift" }, "Left", function() global_move_client_bydir("left") end,
      { description = "move client to the left", group = "client" }),
    -- Move clients to the right
    awful.key({ modkey, "Shift" }, "l", function(c) global_move_client_bydir("right") end,
      { description = "move client to the right", group = "client" }),
    awful.key({ modkey, "Shift" }, "Right", function() global_move_client_bydir("right") end,
      { description = "move client to the right", group = "client" }),
    -- Move clients to the top
    awful.key({ modkey, "Shift" }, "k", function() global_move_client_bydir("up") end,
      { description = "move client to the top", group = "client" }),
    awful.key({ modkey, "Shift" }, "Up", function() global_move_client_bydir("up") end,
      { description = "move client to the top", group = "client" }),
    -- Move clients to the bottom
    awful.key({ modkey, "Shift" }, "j", function() global_move_client_bydir("down") end,
      { description = "move client to the bottom", group = "client" }),
    awful.key({ modkey, "Shift" }, "Down", function() global_move_client_bydir("down") end,
      { description = "move client to the bottom", group = "client" })
  )

  return clientkeys
end

return keys
