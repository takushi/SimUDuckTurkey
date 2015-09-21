//
//  Macro.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/21.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// パーティモード
class MacroCommand: Command {
  /// マクロ
  var commands: [Command]
  /// ログを保存するディスク
  private let disk: Disk
  
  /**
  イニシャライザ
  
  - parameter commands: マクロ
  
  - returns: パーティモードのコマンド
  */
  init(commands: [Command], disk: Disk) {
    self.commands = commands
    self.disk = disk
  }
  
  /**
  パーティモードに変更します
  */
  func execute() {
    for command in self.commands {
      command.execute()
    }
  }
  
  /**
  状態を元に戻します
  */
  func undo() {
    for command in self.commands {
      command.undo()
    }
    self.disk.remove()
  }
  
  /**
  ログにコマンドを保存します
  */
  func store() {
    self.disk.store(self)
  }
  
  /**
  ログを実行します
  */
  func load() {
    self.execute()
  }
}