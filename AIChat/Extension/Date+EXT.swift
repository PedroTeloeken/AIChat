//
//  Date+EXT.swift
//  AIChat
//
//  Created by Pedro Teloeken on 24/12/25.
//

import Foundation

extension Date {
    func addingTimeInterval(
        seconds: Int = 0,
        minutes: Int = 0,
        hours: Int = 0,
        days: Int = 0
    ) -> Date {
        let totalSeconds =
            seconds +
            (minutes * 60) +
            (hours * 3600) +
            (days * 86400)
        
        return addingTimeInterval(TimeInterval(-totalSeconds))
    }
}
