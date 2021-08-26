local velocities = require('config/velocities')

local velocity_selector = {}

local BTN_SPACING_X = 4
local BTN_W = 28

local DEFAULT_COLOR = 'elm_frame'
local SELECTED_COLOR = 'purple'

function velocity_selector.newVelocitySelector(
    x,
    y,
    z,
    selectedIndex,
    onClick
)
    local self = {
        x = x,
        y = y,
        z = z,
        selectedIndex = selectedIndex,
        onClick = onClick,
    }

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

    local function drawButtons(x, y, z)
        for i = 1, #velocities do
            local v = velocities[i]
            local name = 'btnVel' .. v

            local color = DEFAULT_COLOR
            if i == self.selectedIndex then
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
                    self.onClick(i, velocities[i])
                    self.selectedIndex = i
                    changeSelected(i)
                end
            })
        end
    end

    local function render()
        GUI.New('lblVelocity', 'Label', {
            z = self.z,
            x = self.x,
            y = self.y,
            caption = 'Velocity',
            font = 2,
            color = 'txt',
            bg = 'wnd_bg',
            shadow = false
        })

        drawButtons(x + 64, y, z)
    end

    local function getSelectedIndex()
        return self.selectedIndex
    end

    local function getSelectedValue()
        return velocities[self.selectedIndex]
    end

    return {
        getSelectedIndex = getSelectedIndex,
        getSelectedValue = getSelectedValue,
        render = render,
    }
end

return velocity_selector
