local utils = require('utils/utils')

-- C-1 = 0

local SEPARATOR = {
  name = '---',
  pitches = {
    0,
  },
  frets = 0,
  channels = {
    1,
  },
}

local DEFAULT_SELECTED_INDEX = 1

local list = {
  -- Guitar - 8 strings
  {
    name = '[GTR 8, 24] Drop E',
    pitches = {
      64, -- E4
      59, -- B3
      55, -- G3
      50, -- D3
      45, -- A2
      40, -- E2
      35, -- B1
      28, -- E1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },

  {
    name = '[GTR 8, 24] Drop C',
    pitches = {
      60, -- C4
      55, -- G3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
      31, -- G1
      24, -- C1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },
  SEPARATOR,

  -- SPECIAL TUNINGS
  -- Primarily "quality of life" setups

  -- Drop G#|Ab
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the 8-2
  {
    name = '[GTR 7, 20] Drop G#/Ab (Hydra, 8765432)',
    pitches = {
      63, -- D#|Eb4
      58, -- A#|Bb3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      39, -- D#|Eb2
      32, -- G#|Ab1
    },
    frets = 20,
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },

  -- Drop G#|Ab
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the 8-2
  {
    name = '[GTR 7, 22] Drop G#/Ab (Hydra, 8765432)',
    pitches = {
      63, -- D#|Eb4
      58, -- A#|Bb3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      39, -- D#|Eb2
      32, -- G#|Ab1
    },
    frets = 22,
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },

  -- Drop G#|Ab
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the 8-2
  {
    name = '[GTR 7, 23] Drop G#/Ab (Hydra, 8765432)',
    pitches = {
      63, -- D#|Eb4
      58, -- A#|Bb3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      39, -- D#|Eb2
      32, -- G#|Ab1
    },
    frets = 23,
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },

  -- Drop G#|Ab
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the 8-2
  {
    name = '[GTR 7, 24] Drop G#/Ab (Hydra, 8765432)',
    pitches = {
      63, -- D#|Eb4
      58, -- A#|Bb3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      39, -- D#|Eb2
      32, -- G#|Ab1
    },
    frets = {
      24,
      { 1, 24 },
      24,
      24,
      24,
      24,
      24,
    },
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },

  -- Drop F
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the 8-2
  {
    name = '[GTR 7, 22] Drop F (Hydra, 8765432)',
    pitches = {
      60, -- C4
      55, -- G3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
      29, -- F1
    },
    frets = 22,
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    },
  },

  -- Drop B
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the middle 6
  {
    name = '[GTR 6, 22] Drop B (Hydra, middle 6)',
    pitches = {
      61, -- C#|Db3
      56, -- G#|Ab3
      52, -- E3
      47, -- B2
      42, -- F#|Gb2
      35, -- B1
    },
    frets = 22,
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },

  -- Drop C
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the middle 6
  {
    name = '[GTR 6, 21] Drop C (Hydra, middle 6)',
    pitches = {
      62, -- D3
      57, -- A3
      53, -- F3
      48, -- C3
      43, -- G2
      36, -- C2
    },
    frets = 21,
    channels = {
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },

  -- Drop D
  -- Using Shreddage 3 Hydra (8-strings), but only utilizing the middle 6
  {
    name = '[GTR 6, 21] Drop D (Hydra, 754321)',
    pitches = {
      64, -- E4
      59, -- B3
      55, -- G3
      50, -- D3
      45, -- A2
      38, -- D2
    },
    frets = 21,
    channels = {
      1,
      2,
      3,
      4,
      5,
      7,
    },
  },

  SEPARATOR,

  -- Guitar (HYDRA) - 5 strings
  {
    name = '[GTR 5, 24, CH4-8] Drop E',
    pitches = {
      50, -- D3
      45, -- A2
      40, -- E2
      35, -- B1
      28, -- E1
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[GTR 5, 24, CH4-8] Drop F',
    pitches = {
      51, -- D#|Eb3
      46, -- A#|Gb2
      41, -- F2
      36, -- C2
      29, -- F1
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[GTR 5, 24, CH4-8] Drop A',
    pitches = {
      55, -- G3
      50, -- D3
      45, -- A3
      40, -- E2
      33, -- A1
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },

  SEPARATOR,

  -- Guitar - 7 strings
  {
    name = '[GTR 7, 24] Drop E',
    pitches = {
      59, -- B3
      54, -- F#|Gb3
      50, -- D3
      45, -- A2
      40, -- E2
      35, -- B1
      28, -- E1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop F',
    pitches = {
      60, -- C4
      55, -- G3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
      29, -- F1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop F#/Gb',
    pitches = {
      61, -- C#|Db4
      56, -- G#|Ab3
      52, -- E3
      47, -- B2
      42, -- F#|Gb2
      37, -- C#|Db2
      30, -- F#|Gb1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop G',
    pitches = {
      62, -- D4
      57, -- A3
      53, -- F3
      48, -- C3
      43, -- G2
      38, -- D2
      31, -- G1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop G#/Ab',
    pitches = {
      63, -- D#|Eb4
      58, -- A#|Bb3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      39, -- D#|Eb2
      32, -- G#|Ab1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop A',
    pitches = {
      64, -- E4
      59, -- B3
      55, -- G3
      50, -- D3
      45, -- A2
      40, -- E2
      33, -- A1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop A#/Bb',
    pitches = {
      65, -- F4
      60, -- C4
      56, -- G#|Ab3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      34, -- A#|Bb1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop B',
    pitches = {
      66, -- F#|Gb4
      61, -- C#|Db4
      57, -- A3
      52, -- E3
      47, -- B2
      42, -- F#|Gb2
      35, -- B1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop C',
    pitches = {
      67, -- G4
      62, -- D4
      58, -- A#|Bb3
      53, -- F3
      48, -- C3
      43, -- G2
      36, -- C2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop C#/Db',
    pitches = {
      68, -- G#|Ab4
      63, -- D#|Eb4
      59, -- B3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      37, -- C#|Db2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 24] Drop D',
    pitches = {
      69, -- A4
      64, -- E4
      60, -- C4
      55, -- G3
      50, -- D3
      45, -- A2
      38, -- D2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },

  SEPARATOR,

  -- Guitar - 7 strings, 22 frets

  {
    name = '[GTR 7, 22] Drop F',
    pitches = {
      60, -- C4
      55, -- G3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
      29, -- F1
    },
    frets = 22,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },
  {
    name = '[GTR 7, 22] Drop A',
    pitches = {
      64, -- E4
      59, -- B3
      55, -- G3
      50, -- D3
      45, -- A2
      40, -- E2
      33, -- A1
    },
    frets = 22,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    },
  },

  SEPARATOR,

  -- Guitar - 6 strings
  {
    name = '[GTR 6, 24] Drop A',
    pitches = {
      59, -- B3
      54, -- F#|Gb3
      50, -- D3
      45, -- A2
      40, -- E2
      33, -- A1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[GTR 6, 24] Drop A#/Bb',
    pitches = {
      60, -- C4
      55, -- G3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      34, -- A#|Bb1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[GTR 6, 24] Drop B',
    pitches = {
      61, -- C#|Db4
      56, -- G#|Ab3
      52, -- E3
      47, -- B2
      42, -- F#|Gb2
      35, -- B1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[GTR 6, 24] Drop C',
    pitches = {
      62, -- D4
      57, -- A3
      53, -- F3
      48, -- C3
      43, -- G2
      36, -- C2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[GTR 6, 24] Drop C#/Db',
    pitches = {
      63, -- D#|Eb4
      58, -- A#|Bb3
      54, -- F#|Gb3
      49, -- C#|Db3
      44, -- G#|Ab2
      37, -- C#|Db2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[GTR 6, 24] Drop D',
    pitches = {
      64, -- E4
      59, -- B3
      55, -- G3
      50, -- D3
      45, -- A2
      38, -- D2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },

  SEPARATOR,

  {
    name = '[GTR 6, 24] C Standard',
    pitches = {
      60, -- C4
      55, -- G3
      51, -- D#|Eb3
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[GTR 6, 24] E Standard',
    pitches = {
      64, -- E4
      59, -- B3
      55, -- G3
      50, -- D3
      45, -- A2
      40, -- E2
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },

  SEPARATOR,

  -- Basses (HYDRA) - 4 string
  {
    name = '[BASS 4, 24, CH5-8] Drop B',
    pitches = {
      40, -- E2
      35, -- B1
      30, -- F#|Gb1
      23, -- B0
    },
    frets = 24,
    channels = {
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[BASS 4, 24, CH5-8] Drop C#',
    pitches = {
      42, -- F#|Gb2
      37, -- C#|Db2
      32, -- G#|Ab1
      25, -- C#|Db1
    },
    frets = 24,
    channels = {
      5,
      6,
      7,
      8,
    },
  },

  SEPARATOR,

  -- Basses (HYDRA) - 5 string
  {
    name = '[BASS 5, 24, CH4-8] Drop E',
    pitches = {
      38, -- D2
      33, -- A1
      28, -- E1
      23, -- B0
      16, -- E0
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[BASS 5, 24, CH4-8] Drop F',
    pitches = {
      39, -- D#|Eb2
      34, -- A#|Bb1
      29, -- F1
      24, -- C1
      17, -- F0
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[BASS 5, 24, CH4-8] Drop B',
    pitches = {
      45, -- A2
      40, -- E2
      35, -- B1
      30, -- F#|Gb1
      23, -- B0
    },
    frets = 24,
    channels = {
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[BASS 5, 24, CH4-8] Drop C',
    pitches = {
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
      31, -- G1
      24, -- C1
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[BASS 5, 24, CH4-8] Drop C#',
    pitches = {
      47, -- B2
      42, -- F#|Gb2
      37, -- C#|Db2
      32, -- G#|Ab1
      25, -- C#|Db1
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },
  {
    name = '[BASS 5, 24, CH4-8] Drop A',
    pitches = {
      43, -- G2
      38, -- D2
      33, -- A1
      28, -- E1
      21, -- A0
    },
    frets = 24,
    channels = {
      4,
      5,
      6,
      7,
      8,
    },
  },

  SEPARATOR,

  -- Basses (ABYSS) - 6 string
  {
    name = '[BASS 6, 24] Drop E',
    pitches = {
      43, -- G2
      38, -- D2
      33, -- A1
      28, -- E1
      23, -- B0
      16, -- E0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop F',
    pitches = {
      44, -- G#|Ab2
      39, -- D#|Eb2
      34, -- A#|Bb1
      29, -- F1
      24, -- C1
      17, -- F0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop F#/Gb',
    pitches = {
      45, -- A2
      40, -- E2
      35, -- B1
      30, -- F#|Gb1
      25, -- C#|Db1
      18, -- F#|Gb0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop G',
    pitches = {
      46, -- A#|Bb2
      41, -- F2
      36, -- C2
      31, -- G1
      26, -- D1
      19, -- G0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop G#/Ab',
    pitches = {
      47, -- B2
      42, -- F#|Gb2
      37, -- C#|Db2
      32, -- G#|Ab1
      27, -- D#|Eb1
      20, -- G#|Ab0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop A',
    pitches = {
      48, -- C3
      43, -- G2
      38, -- D2
      33, -- A1
      28, -- E1
      21, -- A0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop A#/Bb',
    pitches = {
      49, -- C#|Db3
      44, -- G#|Ab2
      39, -- D#|Eb2
      34, -- A#|Bb1
      29, -- F1
      22, -- A#|Bb0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop B',
    pitches = {
      50, -- D3
      45, -- A2
      40, -- E2
      35, -- B1
      30, -- F#|Gb1
      23, -- B0
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
  {
    name = '[BASS 6, 24] Drop C',
    pitches = {
      51, -- D#|Eb3
      46, -- A#|Gb2
      41, -- F2
      36, -- C2
      31, -- G1
      24, -- C1
    },
    frets = 24,
    channels = {
      1,
      2,
      3,
      4,
      5,
      6,
    },
  },
}

local function toDictionary(list)
  local t = {}
  for i = 1, #list do
    t[list[i].name] = {
      name = list[i].name,
      pitches = list[i].pitches,
      frets = list[i].frets,
      channels = list[i].channels,
    }
  end
  return t
end

local function transformList(list)
  local s = toDictionary(list)
  s.keys = utils.map(
    list, function(item)
      return item.name
    end
  )
  return s
end

local tunings = {
  DEFAULT_SELECTED_INDEX = DEFAULT_SELECTED_INDEX,
  asList = list,
  asDictionary = transformList(list),
}

return tunings
