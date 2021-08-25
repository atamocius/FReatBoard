local velocities = require('config/velocities')

local velocity_selector = {}

local BTN_SPACING_X = 4
local BTN_W = 28

local DEFAULT_COLOR = 'elm_frame'
local SELECTED_COLOR = 'purple'

local function changeSelected(selected)
    for i = 1, #velocities do
        local v = velocities[i]
        local name = 'btnVel' .. v
        local g = GUI.elms[name]

        if i == selected then
            g.col_fill = SELECTED_COLOR
        else
            g.col_fill = DEFAULT_COLOR
        end

        g:init()
    end
end

local function drawButtons(x, y, z, selected, onClick)
    for i = 1, #velocities do
        local v = velocities[i]
        local name = 'btnVel' .. v

        local color = DEFAULT_COLOR
        if i == selected then
            color = SELECTED_COLOR
        end

        GUI.New(name, 'Button', {
            z = z,
            x = x + (i - 1) * (BTN_W + BTN_SPACING_X),
            y = y,
            w = BTN_W,
            h = 24,
            caption = '' .. v,
            font = 3,
            col_txt = 'txt',
            col_fill = color,
            func = function()
                onClick(i)
                changeSelected(i)
            end
        })
    end
end

function velocity_selector.render(x, y, z, selected, onClick)
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

    drawButtons(x + 64, y, z, selected, onClick)
end

return velocity_selector
