//
//  ViewController.swift
//  5chDatGraph
//
//  Created by osanai on 2018/11/29.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FileReader.shared.read()

        // 2018/09/28(金) 08:57:57.48
        
        let start = date(string: "2018/09/28 08:00:00")
        var kijun = start
        var prevIndex = 0

        while (true) {
            for i in max(0,prevIndex-400)..<FileReader.shared.reses.count {
                let res = FileReader.shared.reses[i]
                
                if res.dateTime > kijun {
//                    print(res.resNumAll)
                    print("\(res.threadNum)の\(res.resNum)")
                    prevIndex = i
                    break
                }
            }
            kijun = Date(timeInterval: 3600 * 2, since: kijun)
            if kijun > date(string: "2018/11/01 00:00:00") {
                break
            }
            print(kijun)
        }
    }
    
    func date(string:String) -> Date {
        let f = DateFormatter()
        f.dateFormat = "yyyy/MM/dd HH:mm:ss"
        f.locale = Locale(identifier: "ja_JP")
        return f.date(from: string)!
    }
    
    
    //風の谷の名無しさん＠実況は実況板で </b>(ﾜｯﾁｮｲ 620e-WEEV)<b><>sage<>2018/10/07(日) 02:21:39.94 ID:S/DY0uU50<> 伝説のたえ埋め <>


}

