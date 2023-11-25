# FReatBoard

A MIDI tool for REAPER that allows adding notes to the piano roll using a fretboard-like grid.

![FReatBoard](https://gist.github.com/assets/6222358/c0034546-5b79-4df7-af1a-ffd786646304)

## Features

### Color Coded Octaves
The fretboard is color coded in such a way that all similar octaves have the same color.

![image](https://gist.github.com/assets/6222358/ec3e971e-4b89-4087-aa21-3f0b3dec2826)

### Scale Selector
Select the _tonic note_ and the _scale_ to highlight diatonic notes in the fretboard.

![image](https://gist.github.com/assets/6222358/d4f8ed12-e3e5-42b1-af08-c3dcc06a232c)


### Tuning Selector
Controls the range of notes in the fretboard. Select from a list of presets that change the number of _strings_ and _frets_.

![image](https://gist.github.com/assets/6222358/ae643626-6a39-432a-85a4-5f7d80ef91c9)


### Selection Mode
You can select between _Chords_ or _Single_. With _Chords_ mode, you have to click the _Submit_ button in order to write the MIDI notes. With the _Single_ mode, clicking on a note will write the MIDI note right away.

![image](https://gist.github.com/assets/6222358/3212b901-ead9-4fb8-98ff-d7d7c13d70ee)


### Enharmonic Mode
Controls how you want to visualize enharmonic notes (_sharps_ or _flats_).

![image](https://gist.github.com/assets/6222358/a575cde1-6243-4533-9ddd-8722ccd3044d)


### Velocity Selector
Select the velocity you want the notes written to use.
![image](https://gist.github.com/assets/6222358/56b7076f-3f79-4631-8229-c984108344c3)

## Current State

- This is _pre-alpha_ and was written mainly for my personal use.
- All [_tuning presets_](https://github.com/atamocius/FReatBoard/blob/master/config/tunings.lua) and [_scale presets_](https://github.com/atamocius/FReatBoard/blob/master/config/scales.lua) can be found under the [`config`](https://github.com/atamocius/FReatBoard/tree/master/config) folder and are all _hardcoded_.

