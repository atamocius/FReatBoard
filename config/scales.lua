local scaleUtils = require('config/scale_utils')

local list = {
    -- Major Scales
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

    -- Blues Scales
    {
        name = '[BLUES] Minor Pentatonic + b5 (The Blues Scale)',
        degrees ='1, b3, 4, b5, 5, b7',
    },
    {
        name = '[BLUES] Minor Pentatonic + 3',
        degrees ='1, b3, 3, 4, 5, b7',
    },
    {
        name = '[BLUES] Minor Pentatonic + 7',
        degrees ='1, b3, 4, 5, b7, 7',
    },
    {
        name = '[BLUES] Aeolian + b5 (Nik Nocturnal)',
        degrees ='1, 2, b3, 4, b5, 5, b6, b7',
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

    -- Melodic Minor Scales, Ascending
    {
        name = '[MELO_ASC] Melodic Minor',
        degrees ='1, 2, b3, 4, 5, 6, 7',
    },
    {
        name = '[MELO_ASC] Dorian b2 (Phrygian #6)',
        degrees ='1, b2, b3, 4, 5, 6, b7',
    },
    {
        name = '[MELO_ASC] Lydian Augmented (Lydian #5)',
        degrees ='1, 2, 3, #4, #5, 6, 7',
    },
    {
        name = '[MELO_ASC] Lydian Dominant (Lydian b7)',
        degrees ='1, 2, 3, #4, 5, 6, b7',
    },
    {
        name = '[MELO_ASC] Mixolydian b6 (Melodic Major, Hindu, Aeolian Dominant)',
        degrees ='1, 2, 3, 4, 5, b6, b7',
    },
    {
        name = '[MELO_ASC] Locrian #2 (Half-Diminished, Aeolian b5)',
        degrees ='1, 2, b3, 4, b5, b6, b7',
    },
    {
        name = '[MELO_ASC] Super Locrian (Altered)',
        degrees ='1, b2, b3, b4, b5, b6, b7',
    },

    -- Melodic Minor Scales, Descending
    {
        name = '[MELO_DESC] Descending Melodic Minor (Natural Minor, Aeolian)',
        degrees ='1, 2, b3, 4, 5, b6, b7',
    },
    {
        name = '[MELO_DESC] Descending Dorian b2 (Locrian)',
        degrees ='1, b2, b3, 4, b5, b6, b7',
    },
    {
        name = '[MELO_DESC] Descending Lydian Augmented (Major, Ionian)',
        degrees ='1, 2, 3, 4, 5, 6, 7',
    },
    {
        name = '[MELO_DESC] Descending Lydian Dominant (Dorian)',
        degrees ='1, 2, b3, 4, 5, 6, b7',
    },
    {
        name = '[MELO_DESC] Descending Mixolydian b6 (Phrygian)',
        degrees ='1, b2, b3, 4, 5, b6, b7',
    },
    {
        name = '[MELO_DESC] Descending Locrian #2 (Lydian)',
        degrees ='1, 2, 3, #4, 5, 6, 7',
    },
    {
        name = '[MELO_DESC] Descending Super Locrian (Mixolydian)',
        degrees ='1, 2, 3, 4, 5, 6, b7',
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

    -- Hirajoshi Scales
    -- https://en.wikipedia.org/wiki/Hiraj%C5%8Dshi_scale
    -- https://stringsofrage.com/scales-modes/shinobi-reverse-hirajoshi-pentatonic-scale-its-modes/
    {
        name = '[HIRAJ] Hirajoshi (Aeolian)',
        degrees ='1, 2, b3, 5, b6',
    },
    {
        name = '[HIRAJ] Mode 2 (Locrian)',
        degrees ='1, b2, 4, b5, b7',
    },
    {
        name = '[HIRAJ] Mode 3 (Ionian)',
        degrees ='1, 3, 4, 6, 7',
    },
    {
        name = '[HIRAJ] Mode 4 (Phrygian)',
        degrees ='1, b2, 4, 5, b6',
    },
    {
        name = '[HIRAJ] Mode 5 (Lydian)',
        degrees ='1, 3, #4, 5, 7',
    },
}

return scaleUtils.transformScalesList(list)
