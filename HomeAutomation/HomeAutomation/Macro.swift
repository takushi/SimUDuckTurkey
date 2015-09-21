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
  
  /**
  イニシャライザ
  
  - parameter commands: マクロ
  
  - returns: パーティモードのコマンド
  */
  init(commands: [Command]) {
    self.commands = commands
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
  }
}