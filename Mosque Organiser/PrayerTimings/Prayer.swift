//
//  Prayer.swift
//  Mosque Organiser
//
//  Created by Hassan Sohail Dar on 5/1/22.
//

import Foundation

struct Prayer: Hashable, Identifiable  {
    let id = UUID() //this needs to be investigated.
    
    let name: String
    let time: String
}


struct MockData {
    
    static let samplePrayer = Prayer(name: "Maghrib", time: "07:30 PM")
    static let title = "Prayer Timings"
    static let prayers = [
        Prayer(name: "Fajr", time: "05:00 AM"),
        Prayer(name: "Duhr", time: "01:00 PM"),
        Prayer(name: "Asr", time: "05:30 PM"),
        Prayer(name: "Maghrib", time: "07:35 PM"),
        Prayer(name: "Isha", time: "09:00 PM"),
        Prayer(name: "Jumma", time: "01:30 PM"),
        
        
    ]
}
