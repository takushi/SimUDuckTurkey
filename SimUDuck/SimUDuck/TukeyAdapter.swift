//
//  TukeyAdapter.swift
//  SimUDuck
//
//  Created by Homma Takushi on 2015/09/22.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// 七面鳥を鴨に適合させます
class TurkeyAdapter: Duck {
  /// 七面鳥
  let turkey: Turkey
  
  /**
  イニシャライザ
  
  - parameter turkey: 七面鳥
  
  - returns: 鴨に適合した七面鳥
  */
  init(turkey: Turkey) {
    self.turkey = turkey
  }
  
  /**
  鳴きます
  */
  func quack() {
    self.turkey.gobble()
  }
  
  /**
  飛びます
  */
  func fly() {
    //七面鳥は短い距離しか飛べないため、5回飛びます
    for _ in 1...5 {
      self.turkey.fly()
    }
  }
}