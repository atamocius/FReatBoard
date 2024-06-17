local lib_path = reaper.GetExtState('Lokasenna_GUI', 'lib_path_v2')
if not lib_path or lib_path == '' then
  reaper.MB(
    'Couldn\'t load the Lokasenna_GUI library. Please install ' ..
    '"Lokasenna\'s GUI library v2 for Lua", available on ReaPack, then ' ..
    'run the "Set Lokasenna_GUI v2 library path.lua" script in your ' ..
    'Action List.',
    'Whoops!',
    0
  )
  return
end
loadfile(lib_path .. 'Core.lua')()

GUI.req('Classes/Class - Label.lua')()
GUI.req('Classes/Class - Menubox.lua')()
GUI.req('Classes/Class - Button.lua')()
GUI.req('Classes/Class - Options.lua')()
GUI.req('Classes/Class - Slider.lua')()
GUI.req("Classes/Class - Frame.lua")()

-- If any of the requested libraries weren't found, abort the script.
if missing_lib then return 0 end

local mainPage = require('ui/main_page/index')

local interface = {}

function interface.run()
  GUI.name = 'FReatBoard'
  GUI.x, GUI.y, GUI.w, GUI.h = 0, 0, 826, 400
  GUI.anchor, GUI.corner = 'mouse', 'C'

  mainPage
      .newMainPage()
      .render()

  -- Open the script window and initialize a few things
  GUI.Init()

  -- This will be run on every update loop of the GUI script; anything you
  -- would put inside a reaper.defer() loop should go here.
  -- (The function name doesn't matter)
  GUI.func = function()
    -- Prevent the user from resizing the window
    if GUI.resized then
      -- If the window's size has been changed, reopen it
      -- at the current position with the size we specified
      local __, x, y, w, h = gfx.dock(-1, 0, 0, 0, 0)
      gfx.quit()
      gfx.init(GUI.name, GUI.w, GUI.h, 0, x, y)
      GUI.redraw_z[0] = true
    end
  end

  -- How often (in seconds) to run GUI.func. 0 = every loop.
  -- GUI.freq = 0

  -- Start the main loop
  GUI.Main()
end

return interface
