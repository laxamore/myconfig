local pipewire_module = { mt = {} }

-- Get default sink volume percent with pamixer
function pipewire_module:get_default_sink_volume()
  local fd = io.popen("pamixer --get-volume")
  if fd == nil then
    return 0
  end
  local volume = fd:read("*all")
  fd:close()
  return tonumber(volume)
end

-- Get default sink mute status with pamixer
function pipewire_module:get_default_sink_mute()
  local fd = io.popen("pamixer --get-mute")
  if fd == nil then
    return 0
  end
  local mute = fd:read("*all")
  fd:close()
  if mute == "true\n" then
    return true
  else
    return false
  end
end

-- Increase default sink volume with pamixer
function pipewire_module:increase_default_sink_volume(value)
  local fd = io.popen("pamixer --allow-boost --increase " .. value)
  if fd == nil then
    return 0
  end
  fd:close()
end

-- Decrease default sink volume with pamixer
function pipewire_module:decrease_default_sink_volume(value)
  local fd = io.popen("pamixer --allow-boost --decrease " .. value)
  if fd == nil then
    return 0
  end
  fd:close()
end

-- Toggle default sink mute status with pamixer
function pipewire_module:toggle_default_sink_mute()
  local fd = io.popen("pamixer --toggle-mute")
  if fd == nil then
    return 0
  end
  fd:close()
end

local function new(args)
  local p = { _private = {} }
  setmetatable{p, {__index = pipewire_module}}
  return p
end

function pipewire_module.mt:__call(...)
  return new(...)
end

return setmetatable(pipewire_module, pipewire_module.mt)