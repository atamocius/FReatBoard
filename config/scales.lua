local scaleUtils = require('config/scale_utils')

local list = {
    -- Majos Scales
    {
        name = '[MAJOR] Ionian (Major)',
        degrees = '1, 2, 3, 4, 5, 6, 7',
    },
    {
        name = '[MAJOR] Dorian',
        degrees ='1, 2, b3, 4, 5, 6, b7',
    },
    {
        name = '[MAJOR] Phrygian',
        degrees ='1, b2, b3, 4, 5, b6, b7',
    },
    {
        name = '[MAJOR] Lydian',
        degrees ='1, 2, 3, #4, 5, 6, 7',
    },
    {
        name = '[MAJOR] Mixolydian',
        degrees ='1, 2, 3, 4, 5, 6, b7',
    },
    {
        name = '[MAJOR] Aeolian (Minor)',
        degrees ='1, 2, b3, 4, 5, b6, b7',
    },
    {
        name = '[MAJOR] Locrian',
        degrees ='1, b2, b3, 4, b5, b6, b7',
    },

    -- Pentatonic Scales
    {
        name = '[PENTA] Major Pentatonic (Ionian)',
        degrees ='1, 2, 3, 5, 6',
    },
    {
        name = '[PENTA] Egyptian (Dorian)',
        degrees ='1, 2, 4, 5, b7',
    },
    {
        name = '[PENTA] Blues Minor / Man Gong (Phrygian)',
        degrees ='1, b3, 4, b6, b7',
    },
    {
        name = '[PENTA] Blues Major / Ritsusen (Mixolydian)',
        degrees ='1, 2, 4, 5, 6',
    },
    {
        name = '[PENTA] Minor Pentatonic (Aeolian)',
        degrees ='1, b3, 4, 5, b7',
    },
}

return scaleUtils.transformScalesList(list)
