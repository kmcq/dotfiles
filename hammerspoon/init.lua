-- {{{ Adjust Hammerspoon defaults

hs.hotkey.alertDuration = 0 -- Don't show titles for hotkeys
hs.window.animationDuration = 0 -- Don't animate window movements/resizes
hs.screen.strictScreenInDirection = false -- Don't care about axes
-- }}}

hyper = {"shift", "ctrl"}
reload_keys = {hyper, "R"}
hs.hotkey.bind(reload_keys[1],
               reload_keys[2],
               "Reload Configuration",
               function () hs.reload() end)

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
    window.x = (max.w - window.w)/2
    window.y = (max.h - window.h)/2
end

function hd720(window, screen)
    local max = screen:fullFrame()
    window.w = 1280
    window.h = 720
    window.x = (max.w - window.w)/2
    window.y = (max.h - window.h)/2
end

function halfright(window, screen)
    local max = screen:fullFrame()
    window.x = max.w/2
    window.y = 0
    window.w = max.w/2
    window.h = max.h
end

function halfleft(window, screen)
    local max = screen:fullFrame()
    window.x = 0 window.y = 0 window.w = max.w/2 window.h = max.h
end

function center(window, screen)
    local max = screen:fullFrame()
    window.x = (max.w-window.w)/2 window.y = (max.h-window.h)/2
end

function fcenter(window, screen)
    local max = screen:fullFrame()
    local stepw = max.w/30
    local steph = max.h/30
    window.x = stepw*5 window.y = steph*5 window.w = stepw*20 window.h = steph*20
end

function fullscreen(window, screen)
    local max = screen:fullFrame()
    window.x = 0 window.y = 0 window.w = max.w window.h = max.h
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

resizeextra_lefthalf_keys = {hyper, "h"}
hs.hotkey.bind(resizeextra_lefthalf_keys[1], resizeextra_lefthalf_keys[2], nil, function() resize_win(halfleft) end)

resizeextra_righthalf_keys = {hyper, "l"}
hs.hotkey.bind(resizeextra_righthalf_keys[1], resizeextra_righthalf_keys[2], nil, function() resize_win(halfright) end)

resizeextra_fullscreen_keys = {hyper, "j"}
hs.hotkey.bind(resizeextra_fullscreen_keys[1], resizeextra_fullscreen_keys[2], nil, function() resize_win(fullscreen) end)

resizeextra_fcenter_keys = {hyper, "down"}
hs.hotkey.bind(resizeextra_fcenter_keys[1], resizeextra_fcenter_keys[2], nil, function() resize_win(fcenter) end)

resizeextra_center_keys = {hyper, "return"}
hs.hotkey.bind(resizeextra_center_keys[1], resizeextra_center_keys[2], nil, function() resize_win(center) end)

resizeextra_720hd_keys = {hyper, "7"}
hs.hotkey.bind(resizeextra_720hd_keys[1], resizeextra_720hd_keys[2], nil, function() resize_win(hd720) end)

resizeextra_1080_keys = {hyper, "9"}
hs.hotkey.bind(resizeextra_1080_keys[1], resizeextra_1080_keys[2], nil, function() resize_win(hd1080) end)

resizeextra_movetocenter_keys = {hyper, "Y"}
hs.hotkey.bind(resizeextra_movetocenter_keys[1], resizeextra_movetocenter_keys[2], nil, function() resize_win(movetocenter) end)

resizeextra_rightthird_keys = {hyper, "P"}
hs.hotkey.bind(resizeextra_rightthird_keys[1], resizeextra_rightthird_keys[2], nil, function() resize_win(rightthird) end)

resizeextra_leftthird_keys = {hyper, "W"}
hs.hotkey.bind(resizeextra_leftthird_keys[1], resizeextra_leftthird_keys[2], nil, function() resize_win(leftthird) end)

-- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon
hs.loadSpoon('ControlEscape'):start()
