-- {{{ Adjust Hammerspoon defaults

hs.hotkey.alertDuration = 0 -- Don't show titles for hotkeys
hs.window.animationDuration = 0 -- Don't animate window movements/resizes
hs.screen.strictScreenInDirection = false -- Don't care about axes
-- }}}

hyper = { "shift", "ctrl" }
reload_keys = { hyper, "R" }
hs.hotkey.bind(reload_keys[1],
  reload_keys[2],
  "Reload Configuration",
  function() hs.reload() end)

function resize_win(direction)
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local localf = screen:absoluteToLocal(f)
    direction(localf, screen)
    local absolutef = screen:localToAbsolute(localf)
    win:setFrame(absolutef)
  else
    hs.alert.show("No focused window!")
  end
end

function hd1080(window, screen)
  local max = screen:fullFrame()
  window.w = 1920
  window.h = 1080
  window.x = (max.w - window.w) / 2
  window.y = (max.h - window.h) / 2
end

function hd720(window, screen)
  local max = screen:fullFrame()
  window.w = 1280
  window.h = 720
  window.x = (max.w - window.w) / 2
  window.y = (max.h - window.h) / 2
end

function halfright(window, screen)
  local max = screen:fullFrame()
  window.x = max.w / 2
  window.y = 0
  window.w = max.w / 2
  window.h = max.h
end

function halfleft(window, screen)
  local max = screen:fullFrame()
  window.x = 0
  window.y = 0
  window.w = max.w / 2
  window.h = max.h
end

function center(window, screen)
  local max = screen:fullFrame()
  window.x = (max.w - window.w) / 2
  window.y = (max.h - window.h) / 2
end

function fcenter(window, screen)
  local max = screen:fullFrame()
  local stepw = max.w / 30
  local steph = max.h / 30
  window.x = stepw * 5
  window.y = steph * 5
  window.w = stepw * 20
  window.h = steph * 20
end

function fullscreen(window, screen)
  local max = screen:fullFrame()
  window.x = 0
  window.y = 0
  window.w = max.w
  window.h = max.h
end

function movetocenter(window, screen)
  local max = screen:fullFrame()
  -- window.w = max.w / 2
  -- window.h = max.h
  window.x = max.w / 4
  window.y = 0
end

function leftthird(window, screen)
  local max = screen:fullFrame()
  window.w = max.w / 4
  window.h = max.h
  window.x = 0
  window.y = 0
end

function rightthird(window, screen)
  local max = screen:fullFrame()
  window.w = max.w / 4
  window.h = max.h
  window.x = max.w - (max.w / 4) + 1
  window.y = 0
end

-- }}}

resizeextra_lefthalf_keys = { hyper, "h" }
hs.hotkey.bind(resizeextra_lefthalf_keys[1], resizeextra_lefthalf_keys[2], nil, function() resize_win(halfleft) end)

resizeextra_righthalf_keys = { hyper, "l" }
hs.hotkey.bind(resizeextra_righthalf_keys[1], resizeextra_righthalf_keys[2], nil, function() resize_win(halfright) end)

resizeextra_fullscreen_keys = { hyper, "j" }
hs.hotkey.bind(resizeextra_fullscreen_keys[1], resizeextra_fullscreen_keys[2], nil, function() resize_win(fullscreen) end)

resizeextra_fcenter_keys = { hyper, "down" }
hs.hotkey.bind(resizeextra_fcenter_keys[1], resizeextra_fcenter_keys[2], nil, function() resize_win(fcenter) end)

resizeextra_center_keys = { hyper, "return" }
hs.hotkey.bind(resizeextra_center_keys[1], resizeextra_center_keys[2], nil, function() resize_win(center) end)

resizeextra_720hd_keys = { hyper, "7" }
hs.hotkey.bind(resizeextra_720hd_keys[1], resizeextra_720hd_keys[2], nil, function() resize_win(hd720) end)

resizeextra_1080_keys = { hyper, "9" }
hs.hotkey.bind(resizeextra_1080_keys[1], resizeextra_1080_keys[2], nil, function() resize_win(hd1080) end)

resizeextra_movetocenter_keys = { hyper, "Y" }
hs.hotkey.bind(resizeextra_movetocenter_keys[1], resizeextra_movetocenter_keys[2], nil,
  function() resize_win(movetocenter) end)

resizeextra_rightthird_keys = { hyper, "P" }
hs.hotkey.bind(resizeextra_rightthird_keys[1], resizeextra_rightthird_keys[2], nil, function() resize_win(rightthird) end)

resizeextra_leftthird_keys = { hyper, "W" }
hs.hotkey.bind(resizeextra_leftthird_keys[1], resizeextra_leftthird_keys[2], nil, function() resize_win(leftthird) end)

--- === ControlEscape ===
--- from https://github.com/jasonrudolph/ControlEscape.spoon
--- customized to decrease delay after escape
---
--- Make the `control` key more useful: If the `control` key is tapped, treat it
--- as the `escape` key. If the `control` key is held down and used in
--- combination with another key, then provide the normal `control` key
--- behavior.
local ctrlEsc = {}
ctrlEsc.__index = ctrlEsc
-- Metadata
ctrlEsc.name = 'ControlEscape'
ctrlEsc.version = '0.1'
ctrlEsc.author = 'Jason Rudolph <jason@jasonrudolph.com>'
ctrlEsc.homepage = 'https://github.com/jasonrudolph/ControlEscape.spoon'
ctrlEsc.license = 'MIT - https://opensource.org/licenses/MIT'
function ctrlEsc:init()
  self.sendEscape = false
  self.lastModifiers = {}
  -- If `control` is held for this long, don't send `escape`
  local CANCEL_DELAY_SECONDS = 0.150
  self.controlKeyTimer = hs.timer.delayed.new(CANCEL_DELAY_SECONDS, function()
    self.sendEscape = false
  end)
  -- Create an eventtap to run each time the modifier keys change (i.e., each
  -- time a key like control, shift, option, or command is pressed or released)
  self.controlTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged },
    function(event)
      local newModifiers = event:getFlags()
      -- If this change to the modifier keys does not invole a *change* to the
      -- up/down state of the `control` key (i.e., it was up before and it's
      -- still up, or it was down before and it's still down), then don't take
      -- any action.
      if self.lastModifiers['ctrl'] == newModifiers['ctrl'] then
        return false
      end
      -- If the `control` key has changed to the down state, then start the
      -- timer. If the `control` key changes to the up state before the timer
      -- expires, then send `escape`.
      if not self.lastModifiers['ctrl'] then
        self.lastModifiers = newModifiers
        self.sendEscape = true
        self.controlKeyTimer:start()
      else
        if self.sendEscape then
          hs.eventtap.keyStroke({}, 'escape', 0)
        end
        self.lastModifiers = newModifiers
        self.controlKeyTimer:stop()
      end
      return false
    end
  )
  -- Create an eventtap to run each time a normal key (i.e., a non-modifier key)
  -- enters the down state. We only want to send `escape` if `control` is
  -- pressed and released in isolation. If `control` is pressed in combination
  -- with any other key, we don't want to send `escape`.
  self.keyDownEventTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown },
    function(event)
      self.sendEscape = false
      return false
    end
  )
end

--- ControlEscape:start()
--- Method
--- Start sending `escape` when `control` is pressed and released in isolation
function ctrlEsc:start()
  self.controlTap:start()
  self.keyDownEventTap:start()
end

--- ControlEscape:stop()
--- Method
--- Stop sending `escape` when `control` is pressed and released in isolation
function ctrlEsc:stop()
  -- Stop monitoring keystrokes
  self.controlTap:stop()
  self.keyDownEventTap:stop()
  -- Reset state
  self.controlKeyTimer:stop()
  self.sendEscape = false
  self.lastModifiers = {}
end

ctrlEsc:init()
ctrlEsc:start()

--
-- ctrl+n and ctrl+p support for Chrome
--

-- Hotkey setup
local ctrlNToDown = hs.hotkey.new("ctrl", "n", nil, function()
  hs.eventtap.keyStroke(nil, "down", 0)
end, nil, nil)
local ctrlPToUp = hs.hotkey.new("ctrl", "p", nil, function()
  hs.eventtap.keyStroke(nil, "up", 0)
end, nil, nil)

-- Install watcher for Chrome and Edge
local function applicationWatcher(appName, eventType)
  -- App focused
  if (eventType == hs.application.watcher.activated) then
    if (appName == "Google Chrome" or appName == "HyperList") then
      ctrlNToDown:enable()
      ctrlPToUp:enable()
    end
  end

  -- App lost focus
  -- App terminated
  if (eventType == hs.application.watcher.deactivated or
      eventType == hs.application.watcher.terminated) then
    if (appName == "Google Chrome" or appName == "HyperList") then
      ctrlNToDown:disable()
      ctrlPToUp:disable()
    end
  end
end

local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

--- If app is already running:
if (hs.application.find("Google Chrome") ~= nil) then
  applicationWatcher("Google Chrome", hs.application.watcher.launched)
end
