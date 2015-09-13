//
//  main.swift
//  HelloWorld
//
//  Created by Homma Takushi on 2015/09/05.
//  Copyright (c) 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// 抽象クラス
class abstractClass {
  var member: String! // 抽象クラスのイニシャライザで初期値を設定したくないので!をつけて宣言
  
  func method() {
    fatalError("Abstract Mthod")
  }

  init() {
    if (self.dynamicType === abstractClass.self) {
      fatalError("Abstract Class")
    }
  }
}

/// 具象クラス
class concreteClass : abstractClass {
  
  override func method() {
    println(super.member)
  }
  
  init(member: String) {
    super.init()
    super.member = member // 具象クラスでメンバの初期値を設定
  }
}

var instance: abstractClass
var value: String

// instance = abstractClass() // fatal error: Abstract Class
// value = instance.member    // fatal error: unexpectedly found nil while unwrapping an Optional value
// instance.method()          // fatal error: Abstract Method

instance = concreteClass(member: "hello")
value = instance.member
instance.method()