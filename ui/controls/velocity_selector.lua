local velocities = require('config/velocities')

local velocity_selector = {}

local BTN_SPACING_X = 4
local BTN_W = 28

local function drawButtons(x, y, z)
    for i = 1, #velocities do
        local v = velocities[i]
        local name = 'btnVel' .. v
        GUI.New(name, 'Button', {
            z = z,
            x = x + (i - 1) * (BTN_W + BTN_SPACING_X),
            y = y,
            w = BTN_W,
            h = 24,
            caption = '' .. v,
            font = 3,
            col_txt = 'txt',
            col_fill = 'elm_frame'
        })
    end
end

function velocity_selector.render(x, y, z)
    GUI.New('lblVelocity', 'Label', {
        z = z,
        x = x,
        y = y,
        caption = 'Velocity',
        font = 2,
        color = 'txt',
        bg = 'wnd_bg',
        shadow = false
    })

    drawButtons(x + 64, y, z)
end

return velocity_selector
