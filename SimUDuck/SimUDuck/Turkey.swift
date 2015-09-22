//
//  Turkey.swift
//  SimUDuck
//
//  Created by Homma Takushi on 2015/09/22.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
*  七面鳥
*/
protocol Turkey {
  
  /**
  鳴きます
  */
  func gobble()
  
  /**
  飛びます
  */
  func fly()
}

/// 七面鳥
class WildTurkey: Turkey {
  /**
  鳴きます
  */
  func gobble() {
    print("ゴロゴロ")
  }
  
  /**
  飛びます
  */
  func fly() {
    print("短い距離を飛んでいます")
  }
}