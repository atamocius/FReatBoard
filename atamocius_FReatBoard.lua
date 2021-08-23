PKG_NAME = 'FReatBoard'

-- Modify package.path to include current directory
local workingDir =
    reaper.GetResourcePath() .. '/Scripts/'.. PKG_NAME .. '/?.lua'
package.path = package.path .. ';' .. workingDir

local gui = require('ui/interface')

gui.run()
