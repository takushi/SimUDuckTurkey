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

let light: Light = Light(location: "リビングルーム")
let tv: TV = TV(location: "リビングルーム")
let stereo: Stereo = Stereo(location: "リビングルーム")
let hottub: Hottub = Hottub()

let lightOn: LightOnCommand = LightOnCommand(light: light)
let stereoOn: StereoOnWithCDCommand = StereoOnWithCDCommand(stereo: stereo)
let tvOn: TVOnCommandWithDVD = TVOnCommandWithDVD(tv: tv)
let hottubOn: HottubOnCommandWithJets = HottubOnCommandWithJets(hottub: hottub)
let lightOff: LightOffCommand = LightOffCommand(light: light)
let stereoOff: StereoOffWithCDCommand = StereoOffWithCDCommand(stereo: stereo)
let tvOff: TVOffCommandWithDVD = TVOffCommandWithDVD(tv: tv)
let hottubOff: HottubOffCommand = HottubOffCommand(hottub: hottub)

let partyOn: [Command] = [lightOn, stereoOn, tvOn, hottubOn]
let partyOff: [Command] = [lightOff, stereoOff, tvOff, hottubOff]

let partyOnMacro: MacroCommand = MacroCommand(commands: partyOn)
let partyOffMacro: MacroCommand = MacroCommand(commands: partyOff)

remote.setCommand(0, onCommand: partyOnMacro, offCommand: partyOffMacro)

print(remote.toString())
tv.setInputChannel(Channel.DVD)
print("----- マクロのOnを押す -----")
remote.onButtonWasPushed(0)
print("----- マクロのOffを押す -----")
remote.offButtonWathPushed(0)
