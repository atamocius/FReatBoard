local scaleUtils = require('config/scale_utils')
local utils = require('utils/utils')

local list = {
    {
        name = 'Ionian (Major)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, 4, 5, 6, 7'
        ),
    },
    {
        name = 'Dorian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, b3, 4, 5, 6, b7'
        ),
    },
    {
        name = 'Phrygian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b2, b3, 4, 5, b6, b7'
        ),
    },
    {
        name = 'Lydian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, 4, b5, 6, 7'
        ),
    },
    {
        name = 'Mixolydian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, 3, 4, 5, 6, b7'
        ),
    },
    {
        name = 'Aeolian (Minor)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, b3, 4, 5, b6, b7'
        ),
    },
    {
        name = 'Locrian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b2, b3, 4, b5, b6, b7'
        ),
    },
}

return scaleUtils.transformScalesList(list)
