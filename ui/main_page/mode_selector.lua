local mode_selector = {}

function mode_selector.newModeSelector(
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

  local CHOICES = { 'Chords', 'Single' }
  local NAME = 'rdoMode'

  local function render()
    GUI.New(NAME, 'Radio', {
      z = self.z,
      x = self.x,
      y = self.y,
      w = 85,
      h = 56,
      caption = '',
      optarray = CHOICES,
      dir = 'v',
      font_a = 2,
      font_b = 3,
      col_txt = 'txt',
      col_fill = 'elm_fill',
      bg = 'wnd_bg',
      frame = false,
      shadow = true,
      swap = nil,
      opt_size = 20,
      onupdate = function()
        local i = GUI.Val(NAME)
        if i ~= self.selectedIndex then
          self.selectedIndex = i
          self.onChange(i, CHOICES[i])
        end
      end
    })

    GUI.Val(NAME, self.selectedIndex)
  end

  return {
    render = render,
  }
end

return mode_selector
