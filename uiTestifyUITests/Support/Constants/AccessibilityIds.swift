//
//  AccessibilityIds.swift
//  uiTestifyUITests
//
//  Single source of truth for accessibility identifiers (data-e2e-*), aligned with app.
//

enum AccessibilityIds {

    enum HomeView {
        static let homeViewTitle = "data-e2e-title"
        static let userName = "data-e2e-username"
        static let subtitle = "data-e2e-subtitle"
        static let darkModeToggle = "data-e2e-home-dark-mode-toggle"
        static let autoRefreshToggle = "data-e2e-home-auto-refresh-toggle"
        static let searchField = "data-e2e-home-search"
    }

    enum Dashboard {
        static let gesturePlayground = "data-e2e-dashboard-module-gesture-playground"
        static let animationShowcase = "data-e2e-dashboard-module-animation-showcase"
        static let formTesting = "data-e2e-dashboard-module-form-testing"
        static let listInteraction = "data-e2e-dashboard-module-list-interaction"
        static let dialogsAndSheets = "data-e2e-dashboard-module-dialogs-sheets"
        static let keyboardFocus = "data-e2e-dashboard-module-keyboard-focus"
        static let gestureConflicts = "data-e2e-dashboard-module-gesture-conflicts"
        static let networkState = "data-e2e-dashboard-module-network-state"
        static let asyncLoading = "data-e2e-dashboard-module-async-loading"
        static let loadTest = "data-e2e-dashboard-module-load-test-1000-plus"
        static let navigationFlow = "data-e2e-dashboard-module-navigation-flow"
        static let accessibilityTest = "data-e2e-dashboard-module-accessibility-test"
        static let tabBarBehavior = "data-e2e-dashboard-module-tab-bar-behavior"
        static let formWizard = "data-e2e-dashboard-module-form-wizard"
    }

    enum DashboardCategory {
        static let uiTests = "data-e2e-dashboard-category-ui-tests"
        static let asyncTests = "data-e2e-dashboard-category-async-tests"
        static let navigationTests = "data-e2e-dashboard-category-navigation-tests"
        static let accessibilityTests = "data-e2e-dashboard-category-accessibility-tests"
    }

    enum GesturePlayground {
        static let tapBox = "data-e2e-gesture-playground-tap-box"
        static let longPressBox = "data-e2e-gesture-playground-long-press-box"
        static let doubleTapBox = "data-e2e-gesture-playground-double-tap-box"
        static let dragBox = "data-e2e-gesture-playground-drag-box"
        static let pinchBox = "data-e2e-gesture-playground-pinch-box"
    }

    enum Form {
        static let submitButton = "data-e2e-form-submit"
        static let nameField = "data-e2e-form-name"
        static let emailField = "data-e2e-form-email"
        static let termsToggle = "data-e2e-form-terms-toggle"
        static let errorMessage = "data-e2e-form-error"
        static let successMessage = "data-e2e-form-success"
        static let wizardNextButton = "data-e2e-wizard-next"
        static let wizardNameField = "data-e2e-wizard-name"
        static let wizardEmailField = "data-e2e-wizard-email"
        static let ageField = "data-e2e-wizard-age"
        static let genderPicker = "data-e2e-wizard-gender"
        static let confirmationSummary = "data-e2e-wizard-confirmation"
        static let rolePicker = "data-e2e-form-role"
        static let wizardBackButton = "data-e2e-wizard-back"
    }

    enum Keyboard {
        static let usernameField = "data-e2e-keyboard-username"
        static let emailField = "data-e2e-keyboard-email"
        static let passwordField = "data-e2e-keyboard-password"
        static let submitButton = "data-e2e-keyboard-submit"
        static let successMessage = "data-e2e-keyboard-success"
    }

    enum NavigationFlow {
        static let startFlowButton = "data-e2e-navigation-flow-start"
        static let nameField = "data-e2e-navigation-flow-name"
        static let nextButton = "data-e2e-navigation-flow-next"
        static let submitButton = "data-e2e-navigation-flow-submit"
        static let successMessage = "data-e2e-navigation-flow-success"
    }

    enum Dialogs {
        static let showAlertButton = "data-e2e-dialog-show-alert"
        static let showConfirmationButton = "data-e2e-dialog-show-confirmation"
        static let showSheetButton = "data-e2e-dialog-show-sheet"
        static let showToastButton = "data-e2e-dialog-show-toast"
        static let modalSheet = "data-e2e-dialog-modal-sheet"
        static let toastMessage = "data-e2e-dialog-toast"
    }

    enum List {
        static func listItem(title: String) -> String {
            "data-e2e-list-item-\(Self.slug(title))"
        }

        static func listItemCheckmark(title: String) -> String {
            "data-e2e-list-item-\(Self.slug(title))-checkmark"
        }

        private static func slug(_ title: String) -> String {
            title.lowercased().replacingOccurrences(of: " ", with: "-")
        }

        static let editButton = "data-e2e-list-edit"
        static let emptyState = "data-e2e-list-empty-state"
        static let reorderButton = "data-e2e-list-reorder"
    }

    enum AsyncLoading {
        static let loadButton = "data-e2e-async-load"
        static let loadingIndicator = "data-e2e-async-loading"
        static let reloadButton = "data-e2e-async-reload"
        static let retryButton = "data-e2e-async-retry"
        static let emptyMessage = "data-e2e-async-empty"
        static let errorMessage = "data-e2e-async-error"
        static let itemAlpha = "data-e2e-async-item-alpha"
    }

    enum Network {
        static let onlineToggle = "data-e2e-network-online-toggle"
        static let retryButton = "data-e2e-network-retry"
    }

    enum PerformanceLoad {
        static let searchField = "data-e2e-load-test-search"
        static let itemCountLabel = "data-e2e-load-test-count"

        static func listItem(label: String) -> String {
            let s = label.lowercased().replacingOccurrences(of: " ", with: "-")
            return "data-e2e-load-test-row-\(s)"
        }
    }

    enum AccessibilityScreen {
        static let header = "data-e2e-a11y-header"
        static let sizeCategoryText = "data-e2e-a11y-size-category"
        static let leafImage = "data-e2e-a11y-leaf-image"
        static let labeledButton = "data-e2e-a11y-labeled-button"
        static let iconOnlyButton = "data-e2e-a11y-icon-only-button"
        static let imageToggle = "data-e2e-a11y-image-toggle"
        static let buttonLabelToggle = "data-e2e-a11y-button-label-toggle"
        static let boldTextToggle = "data-e2e-a11y-bold-text-toggle"
        static let reduceMotionToggle = "data-e2e-a11y-reduce-motion-toggle"
    }

    enum TabBarTest {
        static let mainTabView = "data-e2e-tab-bar-main"
        static let toggleBadge = "data-e2e-tab-bar-toggle-badge"
    }

    enum GestureConflict {
        static let zoomableImage = "data-e2e-gesture-conflict-zoom-image"
        static let zoomHUD = "data-e2e-gesture-conflict-zoom-hud"

        static func contentItem(_ index: Int) -> String {
            "data-e2e-gesture-conflict-content-\(index)"
        }
    }
}
