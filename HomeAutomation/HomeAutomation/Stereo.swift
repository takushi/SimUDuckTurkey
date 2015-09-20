//
//  Stereo.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/20.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// ステレオ
class Stereo {
  /// 部屋
  private let room: String
  
  /**
  イニシャライザ
  
  - parameter room: 部屋
  
  - returns: ステレオ
  */
  init(room: String) {
    self.room = room
  }
  
  /**
  ステレオをつけます
  */
  func on() {
    print("\(self.room) ステレオの電源が入っています")
  }
  
  /**
  ステレオを消します
  */
  func off() {
    print("\(self.room) ステレオの電源が切れています")
  }
  
  /**
  CDを入れます
  */
  func setCd() {
    print("\(self.room) ステレオがCD入力に設定されています")
  }
  
  /**
  DVDを入れます
  */
  func setDvd() {
    print("\(self.room) ステレオがDVD入力に設定されています")
  }
  
  /**
  ラジオに設定します
  */
  func setRadio() {
    print("\(self.room) ステレオがラジオ入力に設定されています")
  }
  
  /**
  音量を設定します
  */
  func setVolume(volume: Int) {
    print("\(self.room) ステレオのボリュームが\(volume)に設定されています")
  }
}

/// ステレオでCDを再生します
class StereoOnWithCDCommand: Command {
  /// ステレオ
  private let stereo: Stereo
  
  /**
  イニシャライザ
  
  - parameter stereo: ステレオ
  
  - returns: ステレオでCDを再生するコマンド
  */
  init(stereo: Stereo) {
    self.stereo = stereo
  }
  
  
  func execute() {
    self.stereo.on()
    self.stereo.setCd()
    self.stereo.setVolume(11)
  }
}

/// ステレオの電源を切ります
class StereoOffWithCDCommand: Command {
  /// ステレオ
  private let stereo: Stereo
  
  /**
  イニシャライザ
  
  - parameter stereo: ステレオ
  
  - returns: ステレオでCDを再生するコマンド
  */
  init(stereo: Stereo) {
    self.stereo = stereo
  }
  
  /**
  ステレオの電源を切ります
  */
  func execute() {
    self.stereo.off()
  }
}