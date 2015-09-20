//
//  RemoteControl.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

class SimpleRemoteControl {
  /// コマントを保持するスロット
  private var slot: Command!
  
  /**
  イニシャライザ
  
  - returns: スロットを1つ持つリモコン
  */
  init() {
  }
  
  /**
  コマンドを設定します
  
  - parameter command: コマンド
  */
  func setCommand(command: Command) {
    self.slot = command
  }
  
  /**
  ボタンが押されたときに呼び出されます
  */
  func buttonWasPressed() {
    self.slot.execute()
  }
}

/// リモコン
class RemoteControl {
  /// on用のコマンド
  private var onCommands: [Command]
  /// off用のコマンド
  private var offCommands: [Command]
  
  /**
  イニシャライザ
  
  - returns: リモコン
  */
  init () {
    let noCommand = NoCommand()
    
    self.onCommands = Array(count: 7, repeatedValue: noCommand)
    self.offCommands = Array(count: 7, repeatedValue: noCommand)
  }
  
  /**
  コマンドを設定します
  
  - parameter slot:       スロットの番号
  - parameter onCommand:  on用のコマンド
  - parameter offCommand: off用のコマンド
  */
  func setCommand(slot: Int, onCommand: Command, offCommand: Command) {
    self.onCommands[slot] = onCommand
    self.offCommands[slot] = offCommand
  }

  /**
  onボタンが押されたときに呼び出されます
  
  - parameter slot: 押されたスロットの番号
  */
  func onButtonWasPushed(slot: Int) {
    self.onCommands[slot].execute()
  }
  
  /**
  offボタンが押されたときに呼び出されます
  
  - parameter slot: 押されたスロットの番号
  */
  func offButtonWathPushed(slot: Int) {
    self.offCommands[slot].execute()
  }
  
  /**
  設定内容を確認します
  */
  func toString() -> String {
    var stringBuff: String = String()
    stringBuff = "\n----- リモコン -----\n"
    for i in 0...self.onCommands.count - 1 {
      stringBuff += "[スロット \(String(i))] \(onCommands[i].dynamicType) \(offCommands[i].dynamicType)\n"
    }
    
    return stringBuff
  }
}