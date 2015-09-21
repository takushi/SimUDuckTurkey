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
  /// ログを保存するディスク
  private let disk: Disk
  
  /**
  イニシャライザ
  
  - parameter garageDoor: 車庫のドア
  
  - returns: 車庫のドアを開けるコマンド
  */
  init(garageDoor: GarageDoor, disk: Disk) {
    self.garageDoor = garageDoor
    self.disk = disk
  }
  
  /**
  車庫のドアを開けます
  */
  func execute() {
    self.garageDoor.up()
  }
  
  /**
  車庫のドアを閉じます
  */
  func undo() {
    self.garageDoor.down()
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