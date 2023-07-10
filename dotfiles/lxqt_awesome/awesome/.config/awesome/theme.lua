local theme_assets                              = require("beautiful.theme_assets")
local xresources                                = require("beautiful.xresources")
local dpi                                       = xresources.apply_dpi

local theme                                     = {}

theme.font                                      = "sans 8"

theme.bg_focus                                  = "#1da7bf"
theme.tag_active                                = "#1d69bf"
theme.tag_select                                = "#1da7bf"

theme.border_width                              = dpi(2)
theme.border_normal                             = "#00000000"
theme.border_focus                              = theme.bg_focus

-- tag selected unselected active and inactive
local taglist_square_size                       = dpi(1000)
theme.taglist_squares_sel                       = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.tag_select
)
theme.taglist_squares_unsel                     = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.tag_active
)

return theme