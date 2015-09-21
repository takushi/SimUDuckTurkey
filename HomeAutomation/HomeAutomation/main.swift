//
//  main.swift
//  HomeAutomation
//  「Head First デザインパターン 6章 デザインパターン入門: Commandパターン：呼び出しのカプセル化」をSwiftで実装します。
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

let disk: Disk            = Disk()
let remote: RemoteControl = RemoteControl(disk: disk)

let livingRoomLight: Light = Light(location: "リビングルーム")
let kitchenLight: Light        = Light(location: "キッチン")
let ceilingFan: CeilingFan     = CeilingFan(location: "リビングルーム")
let garageDoor: GarageDoor     = GarageDoor()
let stereo: Stereo             = Stereo(location: "リビングルーム")

let livingRoomLightOn: LightOnCommand   = LightOnCommand(light: livingRoomLight, disk: disk)
let livingRoomLightOff: LightOffCommand = LightOffCommand(light: livingRoomLight, disk: disk)
let kitchenLightOn: LightOnCommand          = LightOnCommand(light: kitchenLight, disk: disk)
let kitchenLightOff: LightOffCommand        = LightOffCommand(light: kitchenLight, disk: disk)
let ceilingFanOn: CeilingFanHighCommand     = CeilingFanHighCommand(ceilingFun: ceilingFan, disk: disk)
let ceilingFanOff: CeilingFanOffCommand     = CeilingFanOffCommand(ceilingFun: ceilingFan, disk: disk)
let garageOpen:GarageDoorOpenCommand        = GarageDoorOpenCommand(garageDoor: garageDoor, disk: disk)
let stereoOnWithCD                          = StereoOnWithCDCommand(stereo: stereo, disk: disk)
let stereoOffWithCD                         = StereoOffWithCDCommand(stereo: stereo, disk: disk)

remote.setCommand(0, onCommand: livingRoomLightOn, offCommand: livingRoomLightOff)
remote.setCommand(1, onCommand: kitchenLightOn, offCommand: kitchenLightOff)
remote.setCommand(2, onCommand: ceilingFanOn, offCommand: ceilingFanOff)
remote.setCommand(3, onCommand: stereoOnWithCD, offCommand: stereoOffWithCD)

print(remote.toString())

print("----- リモコンを操作 -----")
remote.onButtonWasPushed(0)
remote.offButtonWathPushed(0)
remote.onButtonWasPushed(1)
remote.offButtonWathPushed(1)
remote.onButtonWasPushed(2)
remote.offButtonWathPushed(2)
remote.onButtonWasPushed(3)
remote.offButtonWathPushed(3)

print(disk.toString())

print("----- アンドゥボタン -----")
remote.onUndoButtonWasPushed()

print(disk.toString())

print("----- リロードボタン -----")
remote.onReloadButtonWasPushed()