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
  
  /**
  照明を点けます
  */
  func on() {
    print("照明が点いています")
  }
  
  /**
  照明を消します
  */
  func off() {
    print("照明が消えています")
  }
}

/// 照明を点けるコマンド
class LightOnCommand: Command {
  /// 照明
  let light: Light

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