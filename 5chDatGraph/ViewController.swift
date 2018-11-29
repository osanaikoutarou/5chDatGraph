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

        for res in FileReader.shared.reses {
            if res.dateTime > date(string: "2018/11/01 01:10:10") {
                print("こえた!")
                break
            }
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

