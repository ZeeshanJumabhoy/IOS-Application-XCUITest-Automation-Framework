//
//  AccessibilityIds.swift
//  uiTestifyUITests
//
//  Single source of truth for accessibility identifiers (and fixed labels where no id exists).
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

    enum DashboardCategory {
        static let uiTests = "dashboard_category_ui tests"
        static let asyncTests = "dashboard_category_async tests"
    }

    enum GesturePlayground {
        static let tapBox = "TapBox"
        static let longPressBox = "LongPressBox"
        static let doubleTapBox = "DoubleTapBox"
    }

    enum Form {
        static let submitButton = "SubmitButton"
        static let nameField = "NameField"
        static let emailField = "EmailField"
        static let termsToggle = "TermsToggle"
        static let errorMessage = "ErrorMessage"
        static let successMessage = "SuccessMessage"
        static let nextButton = "NextButton"
        static let ageField = "AgeField"
        static let confirmationSummary = "ConfirmationSummary"
    }

    enum Keyboard {
        static let usernameField = "UsernameField"
        static let emailField = "EmailField"
        static let passwordField = "PasswordField"
    }

    enum NavigationFlow {
        static let startFlowButton = "StartFlowButton"
    }

    enum Dialogs {
        static let showAlertButton = "ShowAlertButton"
        static let showConfirmationButton = "ShowConfirmationButton"
        static let showSheetButton = "ShowSheetButton"
        static let showToastButton = "ShowToastButton"
        static let modalSheet = "ModalSheet"
        static let toastMessage = "ToastMessage"
    }

    enum List {
        static func listItem(title: String) -> String { "ListItem_\(title)" }
    }

    enum AsyncLoading {
        static let loadButton = "LoadButton"
        static let loadingIndicator = "LoadingIndicator"
        static let reloadButton = "ReloadButton"
        static let retryButton = "RetryButton"
        static let emptyMessage = "EmptyMessage"
        static let errorMessage = "ErrorMessage"
        static let itemAlpha = "Item_Alpha"
    }

    enum Network {
        static let onlineToggle = "OnlineToggle"
    }

    enum PerformanceLoad {
        static let searchField = "SearchField"
        static func listItem(label: String) -> String { "ListItem_\(label)" }
        static let itemCountLabel = "ItemCountLabel"
    }

    enum AccessibilityScreen {
        static let header = "AccessibilityHeader"
        static let sizeCategoryText = "SizeCategoryText"
        static let leafImage = "LeafImage"
        static let labeledButton = "LabeledButton"
    }

    enum TabBarTest {
        static let mainTabView = "MainTabView"
        static let toggleBadge = "ToggleBadge"
    }

    enum GestureConflict {
        static let zoomableImage = "ZoomableImage"
        static func contentItem(_ index: Int) -> String { "ContentItem_\(index)" }
    }
}
