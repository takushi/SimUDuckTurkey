//
//  Command.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
*  コマンドオブジェクト
*/
protocol Command {

  /**
  コマンドを実行します
  */
  func execute()
  
  /**
  最後のコマンドを取り消します
  */
  func undo()
  
  /**
  コマンドをディスクに保存します
  */
  func store()
  
  /**
  コマンドをリロードして実行します
  */
  func load()
}

/// 初期のコマンド
class NoCommand: Command {
  func execute() {
    print("コマンドが設定されていません")
  }

  func undo() {
    print("コマンドが設定されていません")
  }
  
  func store() {
    //ディスクに保存する必要がありません
  }
  
  func load() {
    //リロードする必要がありません
  }
}