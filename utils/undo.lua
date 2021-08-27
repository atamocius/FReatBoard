local undo = {}

function undo.beginBlock()
    reaper.Undo_BeginBlock()
end

function undo.endBlock(desc)
    local desc = PKG_NAME .. ': ' .. desc
    reaper.Undo_OnStateChange(desc)
    reaper.Undo_EndBlock(desc, -1)
end

return undo