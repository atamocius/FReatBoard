local opacity = 240

GUI.colors['octave-1'] = { 0, 0, 0, opacity }
GUI.colors['octave0'] = { 63, 0, 255, opacity }
GUI.colors['octave1'] = { 255, 25, 227, opacity }
GUI.colors['octave2'] = { 255, 116, 25, opacity }
GUI.colors['octave3'] = { 255, 214, 25, opacity }
GUI.colors['octave4'] = { 25, 255, 35, opacity }
GUI.colors['octave5'] = { 25, 255, 249, opacity }
GUI.colors['octave6'] = { 161, 25, 255, opacity }
GUI.colors['octave7'] = { 0, 0, 0, opacity }
GUI.colors['octave8'] = { 0, 0, 0, opacity }
GUI.colors['octave9'] = { 0, 0, 0, opacity }

local list = {
    [-1] = 'octave-1',
    [0] =  'octave0',
    [1] =  'octave1',
    [2] =  'octave2',
    [3] =  'octave3',
    [4] =  'octave4',
    [5] =  'octave5',
    [6] =  'octave6',
    [7] =  'octave7',
    [8] =  'octave8',
    [9] =  'octave9',
}

return list
