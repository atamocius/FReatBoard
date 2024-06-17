local tunings = require('config/tunings')
local utils = require('utils/utils')

local tuning_selector = {}

function tuning_selector.newTuningSelector(
    x,
    y,
    z,
    selectedTuningIndex,
    onChange
)
  local tuningNames = utils.clone(tunings.asDictionary.keys)

  local self = {
    x = x,
    y = y,
    z = z,
    tuningNames = tuningNames,
    selectedTuningIndex = selectedTuningIndex,
    onChange = onChange,
  }

  local NAME_TUNING = 'mnuTuning'

  local function setTuning(index)
    self.selectedTuningIndex = index

    local g = GUI.elms[NAME_TUNING]
    g.optarray = self.tuningNames
    g:redraw()
  end

  local function render()
    GUI.New(NAME_TUNING, 'Menubox', {
      z = self.z,
      x = self.x,
      y = self.y,
      w = 180,
      h = 20,
      caption = 'Tuning',
      optarray = self.tuningNames,
      retval = 1.0,
      font_a = 3,
      font_b = 4,
      col_txt = 'txt',
      col_cap = 'txt',
      bg = 'wnd_bg',
      pad = 4,
      noarrow = false,
      align = 0,
      onupdate = function()
        local i = GUI.Val(NAME_TUNING)
        if i ~= self.selectedTuningIndex then
          self.selectedTuningIndex = i
          self.onChange(
            self.selectedTuningIndex,
            self.tuningNames[self.selectedTuningIndex]
          )
        end
      end
    })

    GUI.Val(NAME_TUNING, self.selectedTuningIndex)
  end

  local function getSelectedTuningIndex()
    return self.selectedTuningIndex
  end

  local function getSelectedTuningValue()
    return self.tuningNames[self.selectedTuningIndex]
  end

  return {
    getSelectedTuningIndex = getSelectedTuningIndex,
    getSelectedTuningValue = getSelectedTuningValue,
    setTuning = setTuning,
    render = render,
  }
end

return tuning_selector
