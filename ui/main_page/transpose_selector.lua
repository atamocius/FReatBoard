local transpose_selector = {}

function transpose_selector.newTransposeSelector(
    x,
    y,
    z,
    selectedIndex,
    onChange
)
  local self = {
    x = x,
    y = y,
    z = z,
    selectedIndex = selectedIndex,
    onChange = onChange,
  }

  local NAME = 'sldTranspose'
  local LABEL_NAME = 'lblTranspose'

  local function render()
    GUI.New(NAME, 'Slider', {
      z = self.z,
      x = self.x,
      y = self.y,
      w = 140,
      h = 20,
      cap_x = -105,
      cap_y = 20,
      show_values = false,
      caption = 'Transpose',
      font_a = 3,
      font_b = 4,
      min = -24,
      max = 24,
      defaults = 24,
      dir = 'h',
      onupdate = function()
        local i = GUI.Val(NAME)
        if i ~= self.selectedIndex then
          self.selectedIndex = i
          self.onChange(i)
          GUI.Val(LABEL_NAME, i)
        end
      end
    })

    GUI.New(LABEL_NAME, 'Label', {
      z = self.z,
      x = self.x + 148,
      y = self.y - 4,
      caption = 'X',
      font = 3,
    })

    GUI.Val(NAME, self.selectedIndex + 24)
    GUI.Val(LABEL_NAME, GUI.Val(NAME))
  end

  return {
    render = render,
  }
end

return transpose_selector
