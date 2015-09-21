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
  private let location: String
  
  /**
  イニシャライザ
  
  - parameter location: 部屋
  
  - returns: ステレオ
  */
  init(location: String) {
    self.location = location
  }
  
  /**
  ステレオをつけます
  */
  func on() {
    print("\(self.location) ステレオの電源が入っています")
  }
  
  /**
  ステレオを消します
  */
  func off() {
    print("\(self.location) ステレオの電源が切れています")
  }
  
  /**
  CDを入れます
  */
  func setCd() {
    print("\(self.location) ステレオがCD入力に設定されています")
  }
  
  /**
  DVDを入れます
  */
  func setDvd() {
    print("\(self.location) ステレオがDVD入力に設定されています")
  }
  
  /**
  ラジオに設定します
  */
  func setRadio() {
    print("\(self.location) ステレオがラジオ入力に設定されています")
  }
  
  /**
  音量を設定します
  */
  func setVolume(volume: Int) {
    print("\(self.location) ステレオのボリュームが\(volume)に設定されています")
  }
}

/// ステレオでCDを再生します
class StereoOnWithCDCommand: Command {
  /// ステレオ
  private let stereo: Stereo
  /// ログを保存するディスク
  private let disk: Disk
  
  /**
  イニシャライザ
  
  - parameter stereo: ステレオ
  
  - returns: ステレオでCDを再生するコマンド
  */
  init(stereo: Stereo, disk: Disk) {
    self.stereo = stereo
    self.disk = disk
  }
  
  /**
  ステレオでCDを再生します
  */
  func execute() {
    self.stereo.on()
    self.stereo.setCd()
    self.stereo.setVolume(11)
  }
  
  /**
  ステレオの電源を切ります
  */
  func undo() {
    self.stereo.off()
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

/// ステレオの電源を切ります
class StereoOffWithCDCommand: Command {
  /// ステレオ
  private let stereo: Stereo
  /// ログを保存するディスク
  private let disk: Disk
  
  /**
  イニシャライザ
  
  - parameter stereo: ステレオ
  
  - returns: ステレオでCDを再生するコマンド
  */
  init(stereo: Stereo, disk: Disk) {
    self.stereo = stereo
    self.disk = disk
  }
  
  /**
  ステレオの電源を切ります
  */
  func execute() {
    self.stereo.off()
  }
  
  /**
  ステレオでCDを再生します
  */
  func undo() {
    self.stereo.on()
    self.stereo.setCd()
    self.stereo.setVolume(11)
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