//
//  Duck.swift
//  SimUDuck
//
//  Created by Homma Takushi on 2015/09/22.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
*  鴨
*/
protocol Duck {
  /**
  鳴きます
  */
  func quack()
  
  /**
  飛びます
  */
  func fly()
}


class MallardDuck: Duck {
  /**
  鳴きます
  */
  func quack() {
    print("ガーガー")
  }
  
  /**
  飛びます
  */
  func fly() {
    print("飛んでいます")
  }
}