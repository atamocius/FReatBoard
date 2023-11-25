# FReatBoard

A MIDI tool for REAPER that allows adding notes to the piano roll using a fretboard-like grid.

![FReatBoard](/captures/00-main.png)

## Features

### Color Coded Octaves
The fretboard is color coded in such a way that all similar octaves have the same color.

![octaves](/captures/01-octaves.png)

### Scale Selector
Select the _tonic note_ and the _scale_ to highlight diatonic notes in the fretboard.

![scales](/captures/02-scales.png)


### Tuning Selector
Controls the range of notes in the fretboard. Select from a list of presets that change the number of _strings_ and _frets_.

![tunings](/captures/03-tunings.png)


### Selection Mode
You can select between _Chords_ or _Single_. With _Chords_ mode, you have to click the _Submit_ button in order to write the MIDI notes. With the _Single_ mode, clicking on a note will write the MIDI note right away.

![selection](/captures/04-selection.png)


### Enharmonic Mode
Controls how you want to visualize enharmonic notes (_sharps_ or _flats_).

![enharmonic](/captures/05-enharmonic.png)


### Velocity Selector
Select the velocity you want the notes written to use.

![velocity](/captures/06-velocity.png)

## Current State

- This is _pre-alpha_ and was written mainly for my personal use.
- All [_tuning presets_](https://github.com/atamocius/FReatBoard/blob/master/config/tunings.lua) and [_scale presets_](https://github.com/atamocius/FReatBoard/blob/master/config/scales.lua) can be found under the [`config`](https://github.com/atamocius/FReatBoard/tree/master/config) folder and are all _hardcoded_.

