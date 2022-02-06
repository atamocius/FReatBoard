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

    -- Harmonic Minor Scales
    {
        name = '[HARMN] Harmonic Minor (Aeolian #7)',
        degrees ='1, 2, b3, 4, 5, b6, 7',
    },
    {
        name = '[HARMN] Locrian #6',
        degrees ='1, b2, b3, 4, b5, 6, b7',
    },
    {
        name = '[HARMN] Ionian #5 (Augmented Major)',
        degrees ='1, 2, 3, 4, #5, 6, 7',
    },
    {
        name = '[HARMN] Dorian #4 (Ukrainian Dorian)',
        degrees ='1, 2, b3, #4, 5, 6, b7',
    },
    {
        name = '[HARMN] Phrygian Dominant (Phrygian #3)',
        degrees ='1, b2, 3, 4, 5, b6, b7',
    },
    {
        name = '[HARMN] Lydian #2',
        degrees ='1, #2, 3, #4, 5, 6, 7',
    },
    {
        name = '[HARMN] Super Locrian bb7',
        degrees ='1, b2, b3, b4, b5, b6, bb7',
    },

    -- Melodic Minor Scales
    {
        name = '[MELMN] Melodic Minor',
        degrees ='1, 2, b3, 4, 5, 6, 7',
    },
    {
        name = '[MELMN] Dorian b2 (Phrygian #6)',
        degrees ='1, b2, b3, 4, 5, 6, b7',
    },
    {
        name = '[MELMN] Lydian Augmented (Lydian #5)',
        degrees ='1, 2, 3, #4, #5, 6, 7',
    },
    {
        name = '[MELMN] Lydian Dominant (Lydian b7)',
        degrees ='1, 2, 3, #4, 5, 6, b7',
    },
    {
        name = '[MELMN] Mixolydian b6 (Hindu, Aeolian Dominant)',
        degrees ='1, 2, 3, 4, 5, b6, b7',
    },
    {
        name = '[MELMN] Locrian #2 (Half-Diminished, Aeolian b5)',
        degrees ='1, 2, b3, 4, b5, b6, b7',
    },
    {
        name = '[MELMN] Super Locrian',
        degrees ='1, b2, b3, b4, b5, b6, b7',
    },
}

return scaleUtils.transformScalesList(list)
