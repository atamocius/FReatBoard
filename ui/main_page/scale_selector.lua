local scales = require('config/scales')
local scaleUtils = require('config/scale_utils')
local utils = require('utils/utils')

local scale_selector = {}

function scale_selector.newScaleSelector(
    x,
    y,
    z,
    selectedTonicIndex,
    selectedScaleIndex,
    accidental,
    onChange
)
  local scaleNames = utils.clone(scales.keys)
  table.insert(scaleNames, 1, '---')

  local self = {
    x = x,
    y = y,
    z = z,
    scaleNames = scaleNames,
    noteNames = nil,
    selectedTonicIndex = selectedTonicIndex,
    selectedScaleIndex = selectedScaleIndex,
    accidental = accidental,
    onChange = onChange,
  }

  local NAME_TONIC = 'mnuTonic'
  local NAME_SCALE = 'mnuScale'

  local function updateNoteNames()
    self.noteNames = scaleUtils.NOTES[self.accidental]
  end

  local function setAccidental(accidental)
    self.accidental = accidental

    updateNoteNames()

    local g = GUI.elms[NAME_TONIC]
    g.optarray = self.noteNames
    g:redraw()
  end

  updateNoteNames()

  local function render()
    GUI.New(NAME_TONIC, 'Menubox', {
      z = self.z,
      x = self.x,
      y = self.y,
      w = 48,
      h = 20,
      caption = 'Scale',
      optarray = self.noteNames,
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
        local i = GUI.Val(NAME_TONIC)
        if i ~= self.selectedTonicIndex then
          self.selectedTonicIndex = i
          self.onChange(
            self.selectedTonicIndex,
            self.selectedScaleIndex,
            self.noteNames[self.selectedTonicIndex],
            self.scaleNames[self.selectedScaleIndex]
          )
        end
      end
    })

    GUI.New(NAME_SCALE, 'Menubox', {
      z = self.z,
      x = self.x + 54,
      y = self.y,
      w = 180,
      h = 20,
      caption = '',
      optarray = self.scaleNames,
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
        local i = GUI.Val(NAME_SCALE)
        if i ~= self.selectedScaleIndex then
          self.selectedScaleIndex = i
          self.onChange(
            self.selectedTonicIndex,
            self.selectedScaleIndex,
            self.noteNames[self.selectedTonicIndex],
            self.scaleNames[self.selectedScaleIndex]
          )
        end
      end
    })

    GUI.Val(NAME_TONIC, self.selectedTonicIndex)
    GUI.Val(NAME_SCALE, self.selectedScaleIndex)
  end

  local function getSelectedTonicIndex()
    return self.selectedTonicIndex
  end

  local function getSelectedTonicValue()
    return self.noteNames[self.selectedTonicIndex]
  end

  local function getSelectedScaleIndex()
    return self.selectedScaleIndex
  end

  local function getSelectedScaleValue()
    return self.scaleNames[self.selectedScaleIndex]
  end

  return {
    getSelectedTonicIndex = getSelectedTonicIndex,
    getSelectedTonicValue = getSelectedTonicValue,
    getSelectedScaleIndex = getSelectedScaleIndex,
    getSelectedScaleValue = getSelectedScaleValue,
    setAccidental = setAccidental,
    render = render,
  }
end

return scale_selector
