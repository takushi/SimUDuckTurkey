//
//  main.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

let remote: SimpleRemoteControl = SimpleRemoteControl()

let light: Light = Light()
let garageDoor: GarageDoor = GarageDoor()

let lightOn: LightOnCommand = LightOnCommand(light: light)
let garageOpen:GarageDoorOpenCommand = GarageDoorOpenCommand(garageDoor: garageDoor)

remote.setCommand(lightOn)
remote.buttonWasPressed()

remote.setCommand(garageOpen)
remote.buttonWasPressed()

