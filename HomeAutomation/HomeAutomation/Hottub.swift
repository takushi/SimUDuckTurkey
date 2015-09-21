//
//  Hottub.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/21.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// お風呂
class Hottub {
  /// 温度
  var temperature: Int
  
  /**
  イニシャライザ
  
  - returns: お風呂
  */
  init() {
    self.temperature = 37
  }
  
  /**
  お風呂を沸かします
  */
  func on() {
    self.temperature = 40
    print("浴槽が\(self.temperature)度まで熱くなっています")
  }
  
  /**
  お風呂を冷まします
  */
  func off() {
    self.temperature = 37
    print("浴槽が\(self.temperature)度まで冷めています")
  }
  
  /**
  バブルバスを動かします
  */
  func jetsOn() {
    print("バブルバスが動いています！")
  }
}

/// お風呂を沸かすコマンド
class HottubOnCommandWithJets: Command {
  /// お風呂
  let hottub: Hottub
  
  /**
  イニシャライザ
  
  - parameter hottub: お風呂
  
  - returns: お風呂を沸かすコマンド
  */
  init(hottub: Hottub) {
    self.hottub = hottub
  }
  
  /**
  お風呂を沸かします
  */
  func execute() {
    self.hottub.on()
    self.hottub.jetsOn()
  }
  
  /**
  お風呂を冷まします
  */
  func undo() {
    self.hottub.off()
  }
}

/// お風呂を冷ますコマンド
class HottubOffCommand: Command {
  /// お風呂
  let hottub: Hottub
  
  /**
  イニシャライザ
  
  - parameter hottub: お風呂
  
  - returns: お風呂を冷ますコマンド
  */
  init(hottub: Hottub) {
    self.hottub = hottub
  }
  
  /**
  お風呂を冷まします
  */
  func execute() {
    self.hottub.off()
  }
  
  /**
  お風呂を沸かします
  */
  func undo() {
    self.hottub.on()
  }
}