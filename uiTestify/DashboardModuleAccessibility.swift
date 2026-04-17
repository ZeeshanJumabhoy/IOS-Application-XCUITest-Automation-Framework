//
//  DashboardModuleAccessibility.swift
//  uiTestify
//
//  Stable accessibility IDs for dashboard rows — must match AccessibilityIds (UITest target).
//

import Foundation

enum DashboardModuleAccessibility {
    static func categoryIdentifier(for category: TestModuleCategory) -> String {
        switch category {
        case .ui: return "data-e2e-dashboard-category-ui-tests"
        case .async: return "data-e2e-dashboard-category-async-tests"
        case .navigation: return "data-e2e-dashboard-category-navigation-tests"
        case .accessibility: return "data-e2e-dashboard-category-accessibility-tests"
        }
    }

    static func moduleIdentifier(forModuleTitle title: String) -> String {
        switch title {
        case "Gesture Playground": return "data-e2e-dashboard-module-gesture-playground"
        case "Animation Showcase": return "data-e2e-dashboard-module-animation-showcase"
        case "Form Testing": return "data-e2e-dashboard-module-form-testing"
        case "List Interaction": return "data-e2e-dashboard-module-list-interaction"
        case "Dialogs & Sheets": return "data-e2e-dashboard-module-dialogs-sheets"
        case "Keyboard & Focus": return "data-e2e-dashboard-module-keyboard-focus"
        case "Gesture Conflicts": return "data-e2e-dashboard-module-gesture-conflicts"
        case "Network State": return "data-e2e-dashboard-module-network-state"
        case "Async & Loading": return "data-e2e-dashboard-module-async-loading"
        case "Load Test (1000+)": return "data-e2e-dashboard-module-load-test-1000-plus"
        case "Navigation Flow": return "data-e2e-dashboard-module-navigation-flow"
        case "Accessibility Test": return "data-e2e-dashboard-module-accessibility-test"
        case "Tab Bar Behavior": return "data-e2e-dashboard-module-tab-bar-behavior"
        case "Form Wizard": return "data-e2e-dashboard-module-form-wizard"
        default:
            assertionFailure("Add module mapping for: \(title)")
            return "data-e2e-dashboard-module-unknown"
        }
    }
}
