//
//  GradientForeground.swift
//  Meedies
//
//  Created by Misha Causur on 11.01.2022.
//

import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
