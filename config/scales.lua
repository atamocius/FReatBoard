local utils = require('config/scale_utils')

local scales = {
    {
        name = 'Ionian (Major)',
        intervals = utils.toNoteIndices('1, 2, 3, 4, 5, 6, 7'),
    },
    {
        name = 'Phrygian',
        intervals = utils.toNoteIndices('1, b2, b3, 4, 5, b6, b7'),
    },
    {
        name = 'Aeolian (Minor)',
        intervals = utils.toNoteIndices('1, 2, b3, 4, 5, b6, b7'),
    },
}

return scales
