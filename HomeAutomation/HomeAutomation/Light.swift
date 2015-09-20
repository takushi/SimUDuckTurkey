//
//  Light.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// 照明
class Light {
  /// 部屋
  private let room: String
  
  /**
  イニシャライザ
  
  - parameter room: 部屋
  
  - returns: 照明
  */
  init(room: String) {
    self.room = room
  }
  
  /**
  照明を点けます
  */
  func on() {
    print("\(self.room) 照明が点いています")
  }
  
  /**
  照明を消します
  */
  func off() {
    print("\(self.room) 照明が消えています")
  }
}

/// 照明を点けるコマンド
class LightOnCommand: Command {
  /// 照明
  private let light: Light

  /**
  イニシャライザ
  
  - parameter light: 照明
  
  - returns: 照明を点けるコマンド
  */
  init(light: Light) {
    self.light = light
  }
  
  /**
  コマンドを実行します
  */
  func execute() {
    self.light.on()
  }
}

/// 照明を消すコマンド
class LightOffCommand: Command {
  /// 照明
  private let light: Light
  
  /**
  イニシャライザ
  
  - parameter light: 照明
  
  - returns: 照明を点けるコマンド
  */
  init(light: Light) {
    self.light = light
  }
  
  /**
  コマンドを実行します
  */
  func execute() {
    self.light.off()
  }
}
