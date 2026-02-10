//
//  Binding+EXT.swift
//  AIChat
//
//  Created by Pedro Teloeken on 10/02/26.
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T: Sendable>(ifNotNill value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
    
}
