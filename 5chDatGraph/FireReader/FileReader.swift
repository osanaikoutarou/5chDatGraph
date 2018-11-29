//
//  FileReader.swift
//  5chDatGraph
//
//  Created by osanai on 2018/11/29.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class FileReader: NSObject {
    
    static let shared = FileReader()
    
    // 1スレの1番 2018/09/28(金) 08:57:57.48
    // 80スレに不備
    let files = """
    001_1538092677.dat
    002_1538826760.dat
    003_1539271968.dat
    004_1539344102.dat
    005_1539497662.dat
    006_1539649658.dat
    007_1539776549.dat
    008_1539876359.dat
    009_1539903748.dat
    010_1539903419.dat
    011_1540089269.dat
    012_1540238799.dat
    013_1540378288.dat
    014_1540480327.dat
    015_1540512724.dat
    016_1540567928.dat
    017_1540717047.dat
    018_1540873737.dat
    019_1540987481.dat
    020_1541082105.dat
    021_1541089697.dat
    022_1541133559.dat
    023_1541172397.dat
    024_1541235462.dat
    025_1541306502.dat
    026_1541389706.dat
    027_1541461883.dat
    028_1541524833.dat
    029_1541596455.dat
    030_1541659170.dat
    031_1541689385.dat
    032_1541689384.dat
    033_1541696913.dat
    034_1541715457.dat
    035_1541734065.dat
    036_1541754866.dat
    037_1541769171.dat
    038_1541793510.dat
    039_1541830218.dat
    040_1541854411.dat
    041_1541900922.dat
    042_1541940077.dat
    043_1541998327.dat
    044_1542030226.dat
    045_1542095028.dat
    046_1542131682.dat
    047_1542189419.dat
    048_1542250141.dat
    049_1542288546.dat
    050_1542294908.dat
    051_1542298539.dat
    052_1542304410.dat
    053_1542333002.dat
    054_1542349469.dat
    055_1542368526.dat
    056_1542378689.dat
    057_1542406524.dat
    058_1542428638.dat
    059_1542444345.dat
    060_1542459446.dat
    061_1542478495.dat
    062_1542521041.dat
    063_1542544080.dat
    064_1542559261.dat
    065_1542600911.dat
    066_1542627582.dat
    067_1542641969.dat
    068_1542686603.dat
    069_1542709101.dat
    070_1542727629.dat
    071_1542772012.dat
    072_1542796983.dat
    073_1542811435.dat
    074_1542845950.dat
    075_1542862461.dat
    076_1542884161.dat
    077_1542896492.dat
    078_1542899791.dat
    079_1542900773.dat
    080_1542901281.dat
    081_1542905608.dat
    082_1542910183.dat
    083_1542924597.dat
    084_1542934834.dat
    085_1542942825.dat
    086_1542950141.dat
    087_1542959276.dat
    088_1542967569.dat
    089_1542976188.dat
    090_1542983460.dat
    091_1542993469.dat
    092_1542993506.dat
    093_1543033895.dat
    094_1543046129.dat
    095_1543056257.dat
    096_1543065114.dat
    097_1543074794.dat
    098_1543106823.dat
    099_1543118929.dat
    100_1543128502.dat
    101_1543128502.dat
    102_1543146538.dat
    103_1543154391.dat
    104_1543161499.dat
    105_1543193451.dat
    106_1543212261.dat
    107_1543229236.dat
    108_1543237239.dat
    109_1543247304.dat
    110_1543282806.dat
    111_1543299931.dat
    112_1543316764.dat
    113_1543327639.dat
    114_1543336881.dat
    115_1543367025.dat
    116_1543384547.dat
    117_1543384648.dat
    118_1543409026.dat
    """
    
    var fileNames:[String] {
        return files.components(separatedBy: .newlines)
    }
    
    var reses:[Res] = []
    

    func read() {

        for (index, fileName) in fileNames.enumerated() {
            let fileNameHead = fileName.components(separatedBy: ".").first!
            
            if let filepath = Bundle.main.path(forResource: fileNameHead, ofType: "dat") {
                do {
                    let contents = try String(contentsOfFile: filepath, encoding: .utf8)
                    let wk = contents.components(separatedBy: .newlines)
                    print(wk.count)
                    let rowStrings = wk[0..<min(1000,wk.count)]
                    
                    for (resNum, row) in rowStrings.enumerated() {
                        let newRes = Res()
                        newRes.raw = row
                        newRes.threadNum = index + 1
                        newRes.resNum = resNum + 1
                        reses.append(newRes)
//                        newRes.printAll()
                        
                        
                    }
                    
                    print("\(index)")
                } catch {
                    print("Error info: \(error)")
                }
            } else {
                print("Error")
                // example.txt not found!
            }

            
        }
        
        
    }
}
