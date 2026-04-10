//
//  ThemeManager.swift
//  uiTestify
//
//  Created by Aman Kumar on 24/05/25.
//
import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    private let isUITestMode = ProcessInfo.processInfo.environment["UITEST_MODE"] == "1"

    @Published var isDarkMode: Bool {
        didSet {
            // Keep startup simple in UI tests to reduce launch flakiness.
            guard !isUITestMode else { return }
            UIView.appearance().tintColor = UIColor(Color.primary(forDarkMode: isDarkMode))
        }
    }

    init(isDarkMode: Bool = false) {
        self.isDarkMode = isDarkMode
        guard !isUITestMode else { return }
        UIView.appearance().tintColor = UIColor(Color.primary(forDarkMode: isDarkMode))
    }
}
