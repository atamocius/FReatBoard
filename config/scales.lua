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
        name = '[HARMONIC] Harmonic Minor (Aeolian #7)',
        degrees ='1, 2, b3, 4, 5, b6, 7',
    },
    {
        name = '[HARMONIC] Locrian #6',
        degrees ='1, b2, b3, 4, b5, 6, b7',
    },
    {
        name = '[HARMONIC] Ionian #5 (Augmented Major)',
        degrees ='1, 2, 3, 4, #5, 6, 7',
    },
    {
        name = '[HARMONIC] Dorian #4 (Ukrainian Dorian)',
        degrees ='1, 2, b3, #4, 5, 6, b7',
    },
    {
        name = '[HARMONIC] Phrygian Dominant (Phrygian #3)',
        degrees ='1, b2, 3, 4, 5, b6, b7',
    },
    {
        name = '[HARMONIC] Lydian #2',
        degrees ='1, #2, 3, #4, 5, 6, 7',
    },
    {
        name = '[HARMONIC] Super Locrian bb7',
        degrees ='1, b2, b3, b4, b5, b6, bb7',
    },

    -- Melodic Minor Scales
    {
        name = '[MELODIC] Melodic Minor',
        degrees ='1, 2, b3, 4, 5, 6, 7',
    },
    {
        name = '[MELODIC] Dorian b2 (Phrygian #6)',
        degrees ='1, b2, b3, 4, 5, 6, b7',
    },
    {
        name = '[MELODIC] Lydian Augmented (Lydian #5)',
        degrees ='1, 2, 3, #4, #5, 6, 7',
    },
    {
        name = '[MELODIC] Lydian Dominant (Lydian b7)',
        degrees ='1, 2, 3, #4, 5, 6, b7',
    },
    {
        name = '[MELODIC] Mixolydian b6 (Hindu, Aeolian Dominant)',
        degrees ='1, 2, 3, 4, 5, b6, b7',
    },
    {
        name = '[MELODIC] Locrian #2 (Half-Diminished, Aeolian b5)',
        degrees ='1, 2, b3, 4, b5, b6, b7',
    },
    {
        name = '[MELODIC] Super Locrian (Altered)',
        degrees ='1, b2, b3, b4, b5, b6, b7',
    },

    -- Symmetric Scales
    {
        name = '[SYM] Diminished (Whole-Half)',
        degrees ='1, 2, b3, 4, b5, #5, 6, 7',
    },
    {
        name = '[SYM] Dominant Diminished (Half-Whole)',
        degrees ='1, b2, #2, 3, #4, 5, 6, b7',
    },
    {
        name = '[SYM] Whole Tone',
        degrees ='1, 2, 3, #4, #5, b7',
    },
}

return scaleUtils.transformScalesList(list)
