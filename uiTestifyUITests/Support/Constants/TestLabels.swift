//
//  TestLabels.swift
//  uiTestifyUITests
//
//  Visible labels / titles used in queries (not always accessibility ids).
//

enum TestLabels {

    enum GesturePlayground {
        static let taps0 = "Taps: 0"
        static let taps1 = "Taps: 1"
        static let longPressed = "Long Pressed!"
        static let doubleTapped = "Double Tapped!"
    }

    enum Animation {
        static let toggleFade = "Toggle Fade"
        static let reset = "Reset"
    }

    enum Alerts {
        static let importantAlert = "Important Alert"
        static let optionA = "Option A"
        static let confirmationSelectionPrefix = "You selected: Option A"
    }

    enum Sheet {
        static let close = "Close"
    }

    enum TabBar {
        static let search = "Search"
        static let profile = "Profile"
        static let home = "Home"
        static let searchTabTitle = "Search Tab"
        static let profileTabTitle = "Profile Tab"
        static let homeTabTitle = "Home Tab"
    }

    enum System {
        static let ok = "OK"
    }

    enum Image {
        static let checkmarkSelected = "checkmark.circle.fill"
    }
}
