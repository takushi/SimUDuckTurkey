//
//  Disk.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/21.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// コマンドのログを保存するディスク
class Disk {
  private var commands: [Command]
  
  /**
  イニシャライザ
  
  - returns: ディスク
  */
  init() {
    self.commands = []
  }
  
  /**
  コマンドのログを保存します
  
  - parameter command: コマンド
  */
  func store(command: Command) {
    self.commands.append(command)
  }
  
  /**
  ログを読み込みます
  */
  func load() -> Command? {
    
    return (self.commands.count > 0 ? self.commands.removeFirst() : nil)
  }
  
  /**
  最後のログを削除します
  */
  func remove() {
    self.commands.removeLast()
  }
  
  /**
  保存されているログを確認します
  */
  func toString() -> String {
    var stringBuff: String = String()
    for i in 0...self.commands.count - 1 {
      stringBuff += "[ログ \(i)] \(self.commands[i])\n"
    }
    return stringBuff
  }
}