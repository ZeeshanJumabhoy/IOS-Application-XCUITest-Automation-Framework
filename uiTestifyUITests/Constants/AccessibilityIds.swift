//
//  AccessibilityIds.swift
//  uiTestify
//
//  Created by Aman Kumar on 04/02/26.
//

enum AccessibilityIds {

    enum HomeView {
        static let homeViewTitle = "UiTestify Dashboard"
        static let userName = "home_page_greeting_text"
        static let subtitle = "home_page_subtitle_text"
        static let darkModeToggle = "home_page_dark_mode_toggle"
        static let autoRefreshToggle = "home_page_auto_refresh_toggle"
        static let searchField = "home_page_searchBar"
    }

    /// Matches `HomeView` dashboard links: `dashboard_\(title.replacingOccurrences(of: " ", with: "_").lowercased())_button`
    enum Dashboard {
        static let gesturePlayground = "dashboard_gesture_playground_button"
        static let animationShowcase = "dashboard_animation_showcase_button"
        static let formTesting = "dashboard_form_testing_button"
        static let listInteraction = "dashboard_list_interaction_button"
        static let dialogsAndSheets = "dashboard_dialogs_&_sheets_button"
        static let keyboardFocus = "dashboard_keyboard_&_focus_button"
        static let gestureConflicts = "dashboard_gesture_conflicts_button"
        static let networkState = "dashboard_network_state_button"
        static let asyncLoading = "dashboard_async_&_loading_button"
        static let loadTest = "dashboard_load_test_(1000+)_button"
        static let navigationFlow = "dashboard_navigation_flow_button"
        static let accessibilityTest = "dashboard_accessibility_test_button"
        static let tabBarBehavior = "dashboard_tab_bar_behavior_button"
        static let formWizard = "dashboard_form_wizard_button"
    }
}
