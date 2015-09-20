//
//  main.swift
//  HomeAutomation
//  「Head First デザインパターン 6章 デザインパターン入門: Commandパターン：呼び出しのカプセル化」をSwiftで実装します。
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

let remote: RemoteControl = RemoteControl()

let livingRoomLight: Light = Light(room: "リビングルーム")
let kitchenLight: Light = Light(room: "キッチン")
let ceilingFan: CeilingFan = CeilingFan(room: "リビングルーム")
let garageDoor: GarageDoor = GarageDoor()
let stereo: Stereo = Stereo(room: "リビングルーム")

let livingRoomLightOn: LightOnCommand = LightOnCommand(light: livingRoomLight)
let livingRoomLightOff: LightOffCommand = LightOffCommand(light: livingRoomLight)

let kitchenLightOn: LightOnCommand = LightOnCommand(light: kitchenLight)
let kitchenLightOff: LightOffCommand = LightOffCommand(light: kitchenLight)

let ceilingFunOnWithHigh: CeilingFunOnWighHigh = CeilingFunOnWighHigh(ceilingFun: ceilingFan)
let ceilingFunOff: CeilingFunOff = CeilingFunOff(ceilingFun: ceilingFan)

let garageOpen:GarageDoorOpenCommand = GarageDoorOpenCommand(garageDoor: garageDoor)

let stereoOnWithCD = StereoOnWithCDCommand(stereo: stereo)
let stereoOffWithCD = StereoOffWithCDCommand(stereo: stereo)

remote.setCommand(0, onCommand: livingRoomLightOn, offCommand: livingRoomLightOff)
remote.setCommand(1, onCommand: kitchenLightOn, offCommand: kitchenLightOff)
remote.setCommand(2, onCommand: ceilingFunOnWithHigh, offCommand: ceilingFunOff)
remote.setCommand(3, onCommand: stereoOnWithCD, offCommand: stereoOffWithCD)

print(remote.toString())

remote.onButtonWasPushed(0)
remote.offButtonWathPushed(0)
remote.onButtonWasPushed(1)
remote.offButtonWathPushed(1)
remote.onButtonWasPushed(2)
remote.offButtonWathPushed(2)
remote.onButtonWasPushed(3)
remote.offButtonWathPushed(3)