//
//  SizePreferenceKey.swift
//  SwiftUICrypto
//
//  Created by Turker Alan on 14.03.2025.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
