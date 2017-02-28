---------------------------------------------------------
-- General
---------------------------------------------------------
local function remap(key, mods)
  mods = mods or {}
  return function()
    hs.eventtap.keyStroke(mods, key)
  end
end

local function disableAll(keySet)
  for k, v in pairs(keySet) do v:disable() end
end

local function enableAll(keySet)
  for k, v in pairs(keySet) do v:enable() end
end

---------------------------------------------------------
-- DashのみでVim Bindingを適用
---------------------------------------------------------
local vimBinding = {
  hs.hotkey.new({'ctrl'}, 'J', remap('down')),
  hs.hotkey.new({'ctrl'}, 'K', remap('up'))
}

hs.window.filter.new('Dash')
  :subscribe(hs.window.filter.windowFocused, function() enableAll(vimBinding) end)
  :subscribe(hs.window.filter.windowUnfocused, function() disableAll(vimBinding) end)

---------------------------------------------------------
-- Evernote
---------------------------------------------------------
hs.hotkey.bind({'shift', 'ctrl'}, 'L', function()
  local url = 'evernote:///view/233068343/s8/fcb637cb-e67b-42bb-88b9-8cb1e6e68a72/fcb637cb-e67b-42bb-88b9-8cb1e6e68a72/'
  hs.urlevent.openURLWithBundle(url, 'com.evernote.Evernote')
end)

---------------------------------------------------------
-- Reload config
---------------------------------------------------------
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")