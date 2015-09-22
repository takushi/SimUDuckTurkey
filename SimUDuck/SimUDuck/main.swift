//
//  main.swift
//  SimUDuck
//
//  Created by Homma Takushi on 2015/09/22.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
鴨の振る舞いをテストします

- parameter dick: 鴨
*/
func testDuck(duck: Duck) {
  duck.quack()
  duck.fly()
}

let duck: MallardDuck = MallardDuck()
let turkey: WildTurkey = WildTurkey()
let turkeyAdapter: TurkeyAdapter = TurkeyAdapter(turkey: turkey)

print("----- Turkeyの出力 -----")
turkey.gobble()
turkey.fly()

print("----- Duckの出力 -----")
testDuck(duck)

print("----- TurkeyAdapterの出力 -----")
testDuck(turkeyAdapter)