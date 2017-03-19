---------------------------------------------------------
-- General
---------------------------------------------------------
local function keyStroke(key, mods)
  mods = mods or {}
  return function()
    hs.eventtap.keyStroke(mods, key, 1000)
  end
end

local function disableAll(keySet)
  for k, v in pairs(keySet) do v:disable() end
end

local function enableAll(keySet)
  for k, v in pairs(keySet) do v:enable() end
end

local function hasValue (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

---------------------------------------------------------
-- Key Binding
---------------------------------------------------------
local vimBinding = {
  hs.hotkey.bind({'ctrl'}, 'J', keyStroke('down')),
  hs.hotkey.bind({'ctrl'}, 'K', keyStroke('up'))
}

-- local vimBindingApps = {
--   "Alfred 3", "Dash", "Evernote"
-- }
local notVimBindingApps = {
  "Atom", "CotEditor", "iTerm", "Google Chrome", "Night Owl", "Safari"
}

function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    -- hs.alert(name)
    if hasValue(notVimBindingApps, name) then
      disableAll(vimBinding)
    else
      enableAll(vimBinding)
    end
  end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

---------------------------------------------------------
-- DashのみでVim Bindingを適用
---------------------------------------------------------
-- local vimBinding = {
--   hs.hotkey.new({'ctrl'}, 'J', keyStroke('down')),
--   hs.hotkey.new({'ctrl'}, 'K', keyStroke('up'))
-- }

-- hs.window.filter.new('Dash')
--   :subscribe(hs.window.filter.windowFocused, function() enableAll(vimBinding) end)
--   :subscribe(hs.window.filter.windowUnfocused, function() disableAll(vimBinding) end)

-- hs.window.filter.default:allowApp('SystemUIServer')
-- hs.window.filter.new('Spotlight')
--   :subscribe(hs.window.filter.windowFocused, function() alert("aaa") end)

---------------------------------------------------------
-- Evernote
---------------------------------------------------------
hs.hotkey.bind({'shift', 'ctrl'}, 'T', function()
  local url = 'evernote:///view/233068343/s8/fcb637cb-e67b-42bb-88b9-8cb1e6e68a72/fcb637cb-e67b-42bb-88b9-8cb1e6e68a72/'
  hs.urlevent.openURLWithBundle(url, 'com.evernote.Evernote')
end)

-- Macros
local delay = 10000
local lateDelay = 100000
local function moveLineDown()
  return function()
    hs.eventtap.keyStroke({'cmd'}, 'right', delay)
    hs.eventtap.keyStroke({}, 'right', delay)
    hs.eventtap.keyStroke({}, 'delete', delay)
    hs.eventtap.keyStroke({'shift', 'cmd'}, 'left', lateDelay)
    hs.eventtap.keyStroke({'cmd',}, 'X', lateDelay)
    hs.eventtap.keyStroke({}, 'down', delay)
    hs.eventtap.keyStroke({'cmd'}, 'V', delay)
    hs.eventtap.keyStroke({}, 'return', delay)
    hs.eventtap.keyStroke({}, 'delete', delay)
    hs.eventtap.keyStroke({}, 'left', delay)
  end
end

local function moveLineUp()
  return function()
    hs.eventtap.keyStroke({'cmd'}, 'left', delay)
    hs.eventtap.keyStroke({}, 'delete', delay)
    hs.eventtap.keyStroke({'shift', 'cmd'}, 'left', lateDelay)
    hs.eventtap.keyStroke({'cmd',}, 'X', lateDelay)
    hs.eventtap.keyStroke({}, 'down', delay)
    hs.eventtap.keyStroke({'cmd'}, 'V', delay)
    hs.eventtap.keyStroke({}, 'return', delay)
    hs.eventtap.keyStroke({}, 'delete', delay)
    hs.eventtap.keyStroke({}, 'up', delay)
    hs.eventtap.keyStroke({}, 'left', delay)
  end
end

local lineMoveUpDownBinding = {
  hs.hotkey.new({'cmd', 'ctrl'}, 'down', moveLineDown()),
  hs.hotkey.new({'cmd', 'ctrl'}, 'up', moveLineUp())
}

hs.window.filter.new('Evernote')
  :subscribe(hs.window.filter.windowFocused, function() enableAll(lineMoveUpDownBinding) end)
  :subscribe(hs.window.filter.windowUnfocused, function() disableAll(lineMoveUpDownBinding) end)

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
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
