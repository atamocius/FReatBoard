local scaleUtils = require('config/scale_utils')
local utils = require('utils/utils')

local list = {
    {
        name = '[MAJOR] Ionian (Major)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, 4, 5, 6, 7'
        ),
    },
    {
        name = '[MAJOR] Dorian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, b3, 4, 5, 6, b7'
        ),
    },
    {
        name = '[MAJOR] Phrygian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b2, b3, 4, 5, b6, b7'
        ),
    },
    {
        name = '[MAJOR] Lydian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, #4, 5, 6, 7'
        ),
    },
    {
        name = '[MAJOR] Mixolydian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, 4, 5, 6, b7'
        ),
    },
    {
        name = '[MAJOR] Aeolian (Minor)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, b3, 4, 5, b6, b7'
        ),
    },
    {
        name = '[MAJOR] Locrian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b2, b3, 4, b5, b6, b7'
        ),
    },

    {
        name = '[PENTA] Major Pentatonic (Ionian)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, 5, 6'
        ),
    },
    {
        name = '[PENTA] Egyptian (Dorian)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 4, 5, b7'
        ),
    },
    {
        name = '[PENTA] Blues Minor / Man Gong (Phrygian)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b3, 4, b6, b7'
        ),
    },
    {
        name = '[PENTA] Blues Major / Ritsusen (Mixolydian)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 4, 5, 6'
        ),
    },
    {
        name = '[PENTA] Minor Pentatonic (Aeolian)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b3, 4, 5, b7'
        ),
    },
}

return scaleUtils.transformScalesList(list)
