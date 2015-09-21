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

let ceilingFan: CeilingFan = CeilingFan(location: "リビングルーム")

let ceilingFanMedium: CeilingFanMediumCommand = CeilingFanMediumCommand(ceilingFun: ceilingFan)
let ceilingFanHigh: CeilingFanHighCommand = CeilingFanHighCommand(ceilingFun: ceilingFan)
let ceilingFanOff: CeilingFanOffCommand = CeilingFanOffCommand(ceilingFun: ceilingFan)

remote.setCommand(0, onCommand: ceilingFanMedium, offCommand: ceilingFanOff)
remote.setCommand(1, onCommand: ceilingFanHigh, offCommand: ceilingFanOff)

remote.onButtonWasPushed(0)
remote.offButtonWathPushed(0)
print(remote.toString())
remote.undoButtonWasPushed()

remote.onButtonWasPushed(1)
print(remote.toString())
remote.undoButtonWasPushed()