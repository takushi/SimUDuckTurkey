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
}

/// 初期のコマンド
class NoCommand: Command {
  func execute() {
    print("コマンドが設定されていません")
  }
}
