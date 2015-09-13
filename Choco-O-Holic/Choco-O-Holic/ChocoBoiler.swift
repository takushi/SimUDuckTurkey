//
//  ChocoBoiler.swift
//  Choco-O-Holic
//
//  Created by Homma Takushi on 2015/09/13.
//  Copyright (c) 2015年 mfmf.me. All rights reserved.
//

import Foundation

class ChocolateBoiler {
  
  /// 唯一のチョコレート工場
  static let uniqueInstance: ChocolateBoiler = ChocolateBoiler()
  
  /// ボイラが空か
  private var empty: Bool
  
  /// 沸騰しているか
  private var boiled: Bool
  
  /**
  イニシャライザ
  
  :returns: チョコレート工場
  */
  private init() {
    self.empty = true
    self.boiled = false
  }

  /**
  ボイラを満たします
  */
  func fill() {
    if self.isEmpty() {
      empty = false
      boiled = false
      println("牛乳とチョコレートの混合液でボイラを満たします")
    } else {
      println("牛乳とチョコレートの混合液が溢れてしまいます！")
    }
  }
  
  /**
  ボイラから液を抜きます
  */
  func drain() {
    if !self.isEmpty() && self.isBoiled() {
      self.empty = true
      println("沸騰した牛乳とチョコレートの混合液を空にします")
    } else {
      println("牛乳とチョコレートの混合液が入っていません")
    }
  }
  
  /**
  中身を沸騰させます
  */
  func boil() {
    if !self.isEmpty() && !self.isBoiled() {
      self.boiled = true
      println("中身を沸騰させます")
    } else {
      println("空焚きしてはいけません！")
    }
  }
  
  /**
  空か
  
  :returns: True:空 False:空ではない
  */
  func isEmpty() -> Bool {
    return self.empty
  }
  
  /**
  沸騰しているか
  
  :returns: True:沸騰している False:沸騰していない
  */
  func isBoiled() -> Bool {
    return self.boiled
  }
}
