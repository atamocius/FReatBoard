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
        name = 'Phrygian',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, b2, b3, 4, 5, b6, b7'
        ),
    },
    {
        name = 'Aeolian (Minor)',
        rootRelativeIndices = scaleUtils.createAllRootRelativeNoteIndices(
            '1, 2, b3, 4, 5, b6, b7'
        ),
    },
}

function toDictionary()
    local t = {}
    for i = 1, #list do
        t[list[i].name] = list[i].rootRelativeIndices
    end
    return t
end

local scales = toDictionary()
scales.keys = utils.map(list, function(item) return item.name end)

return scales
