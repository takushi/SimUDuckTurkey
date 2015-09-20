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
  var slot: Command!
  
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