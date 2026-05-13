//
//  ABC453A.swift
//  swift-coding-template
//
//  Created by 椎名アヤネ on 2026/05/13.
//

import Foundation

func ABC453A() {
    let n = Int(readLine()!)!
    let ch = readLine()!
    
    guard !ch.isEmpty else {
        print("")
        return
    }
    
    let arr = Array(ch)
    
    var index = 0
    
    for i in 0..<n {
        if arr[i] != "o" {
            index = i + 1
            break
        }
    }

    print(String(arr[index ..< n]))
}
