//
//  CeilingFan.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
扇風機の状態
*/
enum Speed: Int {
  case Off    = 0
  case Low    = 1
  case Medium = 2
  case High   = 3
}

/// 天井の扇風機
class CeilingFan {
  
  /// 部屋
  private let location: String
  /// 扇風機の強さ
  private(set) var speed: Speed
  
  /**
  イニシャライザ
  
  - parameter location: 部屋
  
  - returns: 天井の扇風機
  */
  init (location: String) {
    self.location = location
    self.speed = Speed.Off
  }
  
  /**
  強さを「強」に設定します
  */
  func high() {
    self.speed = Speed.High
    print("\(self.location) 天井の扇風機の強さは「強」です")
  }
  
  /**
  強さを「中」に設定します
  */
  func medium() {
    self.speed = Speed.Medium
    print("\(self.location) 天井の扇風機の強さは「中」です")
  }

  /**
  強さを「弱」に設定します
  */
  func low() {
    self.speed = Speed.Low
    print("\(self.location) 天井の扇風機の強さは「弱」です")
  }
  
  /**
  扇風機を止めます
  */
  func off() {
    self.speed = Speed.Off
    print("\(self.location) 天井の扇風機は止まっています")
  }

}

/// 扇風機を「強」でつけるコマンド
class CeilingFanHighCommand: Command {
  /// 天井の扇風機
  let ceilingFun: CeilingFan
  /// 以前の強さ
  private var prevSpeed: Speed
  
  /**
  イニシャライザ
  
  - parameter ceilingFun: 扇風機
  
  - returns: 扇風機を「強」でつけるコマンド
  */
  init(ceilingFun: CeilingFan) {
    self.ceilingFun = ceilingFun
    self.prevSpeed = Speed.Off
  }
  
  /**
  扇風機を「強」でつけます
  */
  func execute() {
    self.prevSpeed = self.ceilingFun.speed
    self.ceilingFun.high()
  }
  
  /**
  扇風機を以前の状態に戻します
  */
  func undo() {
    switch self.prevSpeed {
    case .High:
      self.ceilingFun.high()
    case .Medium:
      self.ceilingFun.medium()
    case .Low:
      self.ceilingFun.low()
    case .Off:
      self.ceilingFun.off()
    }
  }
}

/// 扇風機を「中」でつけるコマンド
class CeilingFanMediumCommand: Command {
  /// 天井の扇風機
  let ceilingFun: CeilingFan
  /// 以前の強さ
  private var prevSpeed: Speed
  
  /**
  イニシャライザ
  
  - parameter ceilingFun: 扇風機
  
  - returns: 扇風機を「中」でつけるコマンド
  */
  init(ceilingFun: CeilingFan) {
    self.ceilingFun = ceilingFun
    self.prevSpeed = Speed.Off
  }
  
  /**
  扇風機を「中」でつけます
  */
  func execute() {
    self.prevSpeed = self.ceilingFun.speed
    self.ceilingFun.medium()
  }
  
  /**
  扇風機を以前の状態に戻します
  */
  func undo() {
    switch self.prevSpeed {
    case .High:
      self.ceilingFun.high()
    case .Medium:
      self.ceilingFun.medium()
    case .Low:
      self.ceilingFun.low()
    case .Off:
      self.ceilingFun.off()
    }
  }
}

/// 扇風機を止めるコマンド
class CeilingFanOffCommand: Command {
  /// 天井の扇風機
  let ceilingFun: CeilingFan
  /// 以前の強さ
  private var prevSpeed: Speed
  
  /**
  イニシャライザ
  
  - parameter ceilingFun: 扇風機
  
  - returns: 扇風機を止めるコマンド
  */
  init(ceilingFun: CeilingFan) {
    self.ceilingFun = ceilingFun
    self.prevSpeed = Speed.Off
  }
  
  /**
  扇風機を止めます
  */
  func execute() {
    self.prevSpeed = self.ceilingFun.speed
    self.ceilingFun.off()
  }
  
  /**
  扇風機を以前の状態に戻します
  */
  func undo() {
    switch self.prevSpeed {
    case .High:
      self.ceilingFun.high()
    case .Medium:
      self.ceilingFun.medium()
    case .Low:
      self.ceilingFun.low()
    case .Off:
      self.ceilingFun.off()
    }
  }
}
