//
//  TV.swift
//  HomeAutomation
//
//  Created by Homma Takushi on 2015/09/21.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
チャンネル
*/
enum Channel: String {
  case TV  = "テレビ"
  case DVD = "DVD"
}

/// テレビ
class TV {
  /// 部屋
  private let location: String
  /// チャンネル
  private var channel: Channel
  /// 音量
  private var volume: Int
  
  /**
  イニシャライザ
  
  - returns: テレビ
  */
  init(location: String) {
    self.location = location
    self.channel = Channel.TV
    self.volume = 11
  }
  
  /**
  テレビを点けます
  */
  func on() {
    print("\(self.location) TVの電源が入っています")
    self.setInputChannel(self.channel)
  }
  
  /**
  テレビを消します
  */
  func off() {
    print("\(self.location) TVの電源が切れています")
  }
  
  /**
  チャンネルを設定します
  
  - parameter channel: チャンネル
  */
  func setInputChannel(channel: Channel) {
    self.channel = channel
    print("\(self.location) TVのチャンネルが\(self.channel)に設定されています")
  }
  
  /**
  音量を設定します
  
  - parameter volume: 音量
  */
  func setVolume(volume: Int) {
    self.volume = volume
    print("\(self.location) TVの音量が\(self.volume)に設定されています")
  }
}

/// テレビをつけるコマンド
class TVOnCommandWithDVD: Command {
  /**
  *  テレビ
  */
  private let tv: TV
  /// ログを保存するディスク
  private let disk: Disk
  
  /**
  イニシャライザ
  
  - parameter TV: テレビ
  
  - returns: テレビをつけるコマンド
  */
  init(tv: TV, disk: Disk) {
    self.tv = tv
    self.disk = disk
  }
  
  /**
  テレビをつけます
  */
  func execute() {
    self.tv.on()
  }
  
  /**
  テレビを消します
  */
  func undo() {
    self.tv.off()
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

/// テレビを消すコマンド
class TVOffCommandWithDVD: Command {
  /**
  *  テレビ
  */
  private let tv: TV
  /// ログを保存するディスク
  private let disk: Disk
  
  /**
  イニシャライザ
  
  - parameter TV: テレビ
  
  - returns: テレビを消すコマンド
  */
  init(tv: TV, disk: Disk) {
    self.tv = tv
    self.disk = disk
  }
  
  /**
  テレビを消します
  */
  func execute() {
    self.tv.off()
  }
  
  /**
  テレビをつけます
  */
  func undo() {
    self.tv.on()
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