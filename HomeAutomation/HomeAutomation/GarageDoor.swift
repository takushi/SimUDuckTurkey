//
//  GarageDoor.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// 車庫のドア
class GarageDoor {
  
  /**
  ドアを開きます
  */
  func up() {
    print("ドアが開いています")
  }
  
  /**
  ドアを閉じます
  */
  func down() {
    print("ドアが閉じています")
  }
  
  /**
  シャッタの動作を止めます
  */
  func stop() {
    print("ドアが止まっています")
  }
  
  /**
  照明をつけます
  */
  func lightOn() {
    print("照明が点いています")
  }
  
  /**
  照明を消します
  */
  func lightOff() {
    print("照明が消えています")
  }
}

/// 車庫のドアを開けるコマンド
class GarageDoorOpenCommand: Command {
 /// 車庫のドア
  private let garageDoor: GarageDoor
  
  /**
  イニシャライザ
  
  - parameter garageDoor: 車庫のドア
  
  - returns: 車庫のドアを開けるコマンド
  */
  init(garageDoor: GarageDoor) {
    self.garageDoor = garageDoor
  }
  
  /**
  車庫のドアを開けます
  */
  func execute() {
    self.garageDoor.up()
  }
}
