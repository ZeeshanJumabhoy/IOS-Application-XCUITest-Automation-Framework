//
//  AccessibilityTestingView.swift
//  uiTestify
//
//  Created by Aman Kumar on 24/05/25.
//

import SwiftUI

struct AccessibilityTestingView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State private var isImageAccessible = true
    @State private var isButtonLabeled = true
    @State private var boldText = false
    @State private var reduceMotion = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Accessibility Test")
                    .font(.title).bold()
                    .accessibilityIdentifier("data-e2e-a11y-header")

                // Dynamic Type Scaling Test
                Text("Current Size Category: \(sizeCategory.description)")
                    .font(.subheadline)
                    .accessibilityIdentifier("data-e2e-a11y-size-category")

                // Image with/without Accessibility
                Group {
                    if isImageAccessible {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .accessibilityLabel("Green leaf symbol")
                            .accessibilityHint("Represents nature")
                    } else {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .accessibilityHidden(true)
                    }
                }
                .foregroundColor(.green)
                .accessibilityIdentifier("data-e2e-a11y-leaf-image")

                // Button with/without Label
                Group {
                    if isButtonLabeled {
                        Button(action: {}) {
                            Label("Labeled Button", systemImage: "checkmark.circle")
                        }
                        .accessibilityIdentifier("data-e2e-a11y-labeled-button")
                    } else {
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle")
                        }
                        .accessibilityIdentifier("data-e2e-a11y-icon-only-button")
                    }
                }

                // Toggle Controls to Test A11y Behavior
                VStack(spacing: 12) {
                    Toggle("Image is Accessible", isOn: $isImageAccessible)
                        .accessibilityIdentifier("data-e2e-a11y-image-toggle")

                    Toggle("Button has Label", isOn: $isButtonLabeled)
                        .accessibilityIdentifier("data-e2e-a11y-button-label-toggle")

                    Toggle("Simulate Bold Text", isOn: $boldText)
                        .accessibilityIdentifier("data-e2e-a11y-bold-text-toggle")

                    Toggle("Simulate Reduce Motion", isOn: $reduceMotion)
                        .accessibilityIdentifier("data-e2e-a11y-reduce-motion-toggle")
                }

                Spacer()
            }
            .padding()
            .font(boldText ? .headline : .body)
            .animation(reduceMotion ? nil : .default, value: boldText)
        }
        .navigationTitle("Accessibility")
    }
}

extension ContentSizeCategory {
    var description: String {
        switch self {
        case .extraSmall: return "XS"
        case .small: return "S"
        case .medium: return "M"
        case .large: return "L (Default)"
        case .extraLarge: return "XL"
        case .extraExtraLarge: return "XXL"
        case .extraExtraExtraLarge: return "XXXL"
        case .accessibilityMedium: return "A11y M"
        case .accessibilityLarge: return "A11y L"
        case .accessibilityExtraLarge: return "A11y XL"
        case .accessibilityExtraExtraLarge: return "A11y XXL"
        case .accessibilityExtraExtraExtraLarge: return "A11y XXXL"
        @unknown default: return "Unknown"
        }
    }
}
