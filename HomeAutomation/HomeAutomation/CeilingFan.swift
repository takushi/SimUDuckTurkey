//
//  CeilingFan.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// 天井の扇風機
class CeilingFan {
  /// 部屋
  private let room: String
  
  /**
  イニシャライザ
  
  - parameter room: 部屋
  
  - returns: 天井の扇風機
  */
  init (room: String) {
    self.room = room
  }
  
  /**
  強さを「強」に設定します
  */
  func high() {
    print("\(self.room) 天井の扇風機の強さは「強」です")
  }
  
  /**
  強さを「中」に設定します
  */
  func midium() {
    print("\(self.room) 天井の扇風機の強さは「中」です")
  }

  /**
  強さを「弱」に設定します
  */
  func low() {
    print("\(self.room) 天井の扇風機の強さは「弱」です")
  }
  
  /**
  扇風機を止めます
  */
  func off() {
    print("\(self.room) 天井の扇風機は止まっています")
  }
}

/// 扇風機を「強」でつけるコマンド
class CeilingFunOnWighHigh: Command {
  /// 天井の扇風機
  let ceilingFun: CeilingFan
  
  /**
  イニシャライザ
  
  - parameter ceilingFun: 扇風機
  
  - returns: 扇風機を「強」でつけるコマンド
  */
  init(ceilingFun: CeilingFan) {
    self.ceilingFun = ceilingFun
  }
  
  /**
  扇風機を「強」でつけます
  */
  func execute() {
    self.ceilingFun.high()
  }
}

/// 扇風機を止めるコマンド
class CeilingFunOff: Command {
  /// 天井の扇風機
  let ceilingFun: CeilingFan
  
  /**
  イニシャライザ
  
  - parameter ceilingFun: 扇風機
  
  - returns: 扇風機を止めるコマンド
  */
  init(ceilingFun: CeilingFan) {
    self.ceilingFun = ceilingFun
  }
  
  /**
  扇風機を止めます
  */
  func execute() {
    self.ceilingFun.off()
  }
}
