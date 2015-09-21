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
  /// undo用のコマンド
  private var undoCommand: Command
  /// ログを保存するディスク
  private var disk: Disk
  
  /**
  イニシャライザ
  
  - returns: リモコン
  */
  init (disk: Disk) {
    let noCommand = NoCommand()
    
    self.onCommands = Array(count: 7, repeatedValue: noCommand)
    self.offCommands = Array(count: 7, repeatedValue: noCommand)
    self.undoCommand = noCommand
    self.disk = disk
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
    self.onCommands[slot].store()
    self.onCommands[slot].execute()
    self.undoCommand = onCommands[slot]
  }
  
  /**
  offボタンが押されたときに呼び出されます
  
  - parameter slot: 押されたスロットの番号
  */
  func offButtonWathPushed(slot: Int) {
    self.offCommands[slot].store()
    self.offCommands[slot].execute()
    self.undoCommand = offCommands[slot]
  }
  
  /**
  undoボタンが押されたときに呼び出されます
  */
  func onUndoButtonWasPushed() {
    self.undoCommand.undo()
  }
  
  /**
  reloadボタンが押されたときに呼び出されます
  */
  func onReloadButtonWasPushed() {
    while let command = self.disk.load() {
      command.load()
    }
  }
  
  /**
  設定内容を確認します
  */
  func toString() -> String {
    var stringBuff: String = String()
    stringBuff = "\n----- リモコン -----\n"
    for i in 0...self.onCommands.count - 1 {
      stringBuff += "[スロット \(String(i))] \(self.onCommands[i].dynamicType) \(self.offCommands[i].dynamicType)\n"
    }
    stringBuff += "[アンドゥ] \(self.undoCommand.dynamicType)\n"
    return stringBuff
  }
}