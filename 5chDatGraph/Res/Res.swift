//
//  Res.swift
//  5chDatGraph
//
//  Created by osanai on 2018/11/29.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class Res: NSObject {
    var threadNum:Int = 0
    var resNum:Int = 0
    var raw:String = ""
    
    var resNumAll:Int {
        return (threadNum - 1 * 1000) + resNum
    }
    var timeStr:String? {
        return raw.capture(pattern: "\\d{4}/\\d{1,2}/\\d{1,2}...............", group: 0)
    }
    var dateTimeStr:String? {
        guard let timeStr = timeStr else {
            return ""
        }
        let ds = String(timeStr.prefix(10))
        let ts = timeStr[timeStr.index(timeStr.endIndex, offsetBy: -11)...]
        let dsts = ds + " " + String(ts.prefix(8))
        return dsts
    }
    var dateTime:Date {
        let f = DateFormatter()
        f.dateFormat = "yyyy/MM/dd HH:mm:ss"
        f.locale = Locale(identifier: "ja_JP")
        let dts = dateTimeStr!
        let result = f.date(from: dts)!
        return result
    }
    func dateToString(_ date:Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return dateFormater.string(from: date)
    }
    
    func printAll() {
        if let timeStr = timeStr {
            print("\(threadNum)スレの\(resNum)番 \(timeStr)")
            print("--")
            print(dateToString(dateTime))
        }
    }
    
    
    //
    
    
    func printIfNeed() {
        
    }
    
    
}




extension String {
    
    /// 正規表現でキャプチャした文字列を抽出する
    ///
    /// - Parameters:
    ///   - pattern: 正規表現
    ///   - group: 抽出するグループ番号(>=1)
    /// - Returns: 抽出した文字列
    func capture(pattern: String, group: Int) -> String? {
        let result = capture(pattern: pattern, group: [group])
        return result.isEmpty ? nil : result[0]
    }
    
    /// 正規表現でキャプチャした文字列を抽出する
    ///
    /// - Parameters:
    ///   - pattern: 正規表現
    ///   - group: 抽出するグループ番号(>=1)の配列
    /// - Returns: 抽出した文字列の配列
    func capture(pattern: String, group: [Int]) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        
        guard let matched = regex.firstMatch(in: self, range: NSRange(location: 0, length: self.count)) else {
            return []
        }
        
        return group.map { group -> String in
            return (self as NSString).substring(with: matched.range(at: group))
        }
    }
}
//＜使用例＞
//
//let pattern = "^(https?)://([^/]+)/?"
//let str = "https://www.google.co.jp/"
//
//print(str.capture(pattern: pattern, group: 2))
//// Optional("www.google.co.jp")
//
//print(str.capture(pattern: pattern, group: [1, 2]))
//// ["https", "www.google.co.jp"]

//風の谷の名無しさん＠実況は実況板で </b>(ﾜｯﾁｮｲ 620e-WEEV)<b><>sage<>2018/10/07(日) 02:21:39.94 ID:S/DY0uU50<> 伝説のたえ埋め <>
