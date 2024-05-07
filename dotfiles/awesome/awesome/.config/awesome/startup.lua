local awful = require('awful')

local autostarts = {
  'picom --config ~/.config/picom/picom.conf',
  'nm-applet',
  'nextcloud --background',
  'blueman-applet',
  'xset s off -dpms', -- disable DPMS (let LXQT handle all power management)
  'flameshot',
  'fcitx5',
}

local autostart = {}

function autostart:init()
  for _, app in ipairs(autostarts) do
    awful.spawn.with_shell(app)
  end
end

return autostart
