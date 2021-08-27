local midi = {}

local function cursorPosition()
    return reaper.GetCursorPosition()
end

local function activeEditor()
    return reaper.MIDIEditor_GetActive()
end

local function activeTake()
    return reaper.MIDIEditor_GetTake(activeEditor())
end

local function activeMediaItem()
    return reaper.GetMediaItemTake_Item(activeTake())
end

local function mediaItemStartPosition()
    return reaper.GetMediaItemInfo_Value(activeMediaItem(), 'D_POSITION')
end

local function mediaItemStartPositionPPQ()
    return reaper.MIDI_GetPPQPosFromProjTime(
        activeTake(),
        mediaItemStartPosition()
    )
end

local function mediaItemStartPositionQN()
    return reaper.MIDI_GetProjQNFromPPQPos(
        activeTake(),
        mediaItemStartPositionPPQ()
    )
end

local function gridUnitLength()
    local gridLengthQN = reaper.MIDI_GetGrid(activeTake())
    local mediaItemPlusGridLengthPPQ = reaper.MIDI_GetPPQPosFromProjQN(
        activeTake(),
        mediaItemStartPositionQN() + gridLengthQN
    )
    local mediaItemPlusGridLength = reaper.MIDI_GetProjTimeFromPPQPos(
        activeTake(),
        mediaItemPlusGridLengthPPQ
    )
    return mediaItemPlusGridLength - mediaItemStartPosition()
end

local function moveEditCursorPosition(adjamt)
    local moveTimeSelection = false
    reaper.MoveEditCursor(adjamt, moveTimeSelection)
end

function midi.getCurrentVelocity()
    if activeEditor() == nil then
      return 96
    end
    return reaper.MIDIEditor_GetSetting_int(activeEditor(), "default_note_vel")
end

function midi.getCurrentPitch()
    if activeEditor() == nil then
      return 33
    end
    return reaper.MIDIEditor_GetSetting_int(activeEditor(), "active_note_row")
end

function midi.getCurrentChannel()
    if activeEditor() == nil then
      return 0
    end
    return reaper.MIDIEditor_GetSetting_int(activeEditor(), "default_note_chan")
end

function midi.getStartPositionPPQ()
    return reaper.MIDI_GetPPQPosFromProjTime(
        activeTake(),
        cursorPosition()
    )
end

function midi.getEndPositionPPQ()
    return reaper.MIDI_GetPPQPosFromProjTime(
        activeTake(),
        cursorPosition() + gridUnitLength()
    )
end

function midi.moveCursorToEnd()
    moveEditCursorPosition(gridUnitLength())
end

function midi.insertNote(pitch, channel, velocity, startPPQ, endPPQ)
    pitch = pitch or midi.getCurrentPitch()
    channel = channel or midi.getCurrentChannel()
    velocity = velocity or midi.getCurrentVelocity()
    startPPQ = startPPQ or midi.getStartPositionPPQ()
    endPPQ = endPPQ or midi.getEndPositionPPQ()

    local noteIsMuted = false
    local selected = false
    local noSort = false

    reaper.MIDI_InsertNote(
        activeTake(),
        selected,
        noteIsMuted,
        startPPQ,
        endPPQ,
        channel,
        pitch,
        velocity,
        noSort
    )
end

function midi.insertNoteByLength(pitch, channel, velocity, startPPQ, lengthPPQ)
    midi.insertNote(
        pitch,
        channel,
        velocity,
        startPPQ,
        startPPQ + lengthPPQ
    )
end

function midi.getSelectedNotes()
    local take = activeTake()
    local _, notecnt, _, _ = reaper.MIDI_CountEvts(take)

    local results = {}

    for i = 0, notecnt - 1 do
        local _, selected, muted, startppq, endppq, chan, pitch, vel =
            reaper.MIDI_GetNote(take, i)

        if selected then
            table.insert(results, {
                index = i,
                selected = selected,
                muted = muted,
                startppq = startppq,
                endppq = endppq,
                chan = chan,
                pitch = pitch,
                vel = vel,
                length = endppq - startppq
            })
        end
     end

     return results
end

function midi.setNote(
    noteidx,
    selectedIn,
    mutedIn,
    startppqposIn,
    endppqposIn,
    chanIn,
    pitchIn,
    velIn,
    noSortIn
)
    return reaper.MIDI_SetNote(
        activeTake(),
        noteidx,
        selectedIn,
        mutedIn,
        startppqposIn,
        endppqposIn,
        chanIn,
        pitchIn,
        velIn,
        noSortIn
    )
end

function midi.sort()
    reaper.MIDI_Sort(activeTake())
end

local function runCommand(cmdId)
    reaper.MIDIEditor_OnCommand(activeEditor(), cmdId)
end

midi.NOTE_LENGTH_QTR = 960
midi.NOTE_LENGTH_8TH = midi.NOTE_LENGTH_QTR // 2
midi.NOTE_LENGTH_16TH = midi.NOTE_LENGTH_QTR // 4
midi.NOTE_LENGTH_32ND = midi.NOTE_LENGTH_QTR // 8
midi.NOTE_LENGTH_64TH = midi.NOTE_LENGTH_QTR // 16

midi.NOTE_LENGTH_QTR_DOTTED = midi.NOTE_LENGTH_QTR + midi.NOTE_LENGTH_8TH
midi.NOTE_LENGTH_8TH_DOTTED = midi.NOTE_LENGTH_8TH + midi.NOTE_LENGTH_16TH
midi.NOTE_LENGTH_16TH_DOTTED = midi.NOTE_LENGTH_16TH + midi.NOTE_LENGTH_32ND
midi.NOTE_LENGTH_32ND_DOTTED = midi.NOTE_LENGTH_32ND + midi.NOTE_LENGTH_64TH

return midi
