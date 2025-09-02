<p align="center">
    <img src="icon.png" />
</p>

**ResolutionScaler** is a node that can be dropped into any scene to enable dynamic resolution scaling with a target FPS.

## Installation
Either copy [resolution_scaler.gd](addons/resolution_scaler/resolution_scaler.gd) into a folder of your choosing, or install Resolution Scaler via the Godot asset lib tab within the editor.


## Usage
Add a new `ResolutionScaler` node to any scene that you want to support dynamic resolution scaling and configure the following properties in the inspector window:

- **Enabled:** used to toggle whether the scaling is enabled or not
- **Frames to Ignore:** when your game is initialising, there's going to be some low reported frame rates, if you don't ignore an arbitrary number of frames, the resolution scaler will start to reduce the resolution scale far below what the user needs. The optimal amount found during testing for this is 120 and is the default value.
- **Maximum Scale:** if the frame rate is above the target frame rate, the scaler will begin to raise the resolution scale again. If you want to avoid super sampling, then leave this set to 1.0.
- **Target FPS:** the FPS that the scaler should aim to bring the user toward.

## Demo
An example of how a game looks / performs with a `ResolutionScaler` node can be found on [This Post](https://blog.fiveninegames.io/adding-support-for-macos/)

## License
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
