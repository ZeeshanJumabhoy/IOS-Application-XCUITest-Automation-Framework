//
//  AnimationGestureConflictPage.swift
//

import XCTest

final class AnimationGestureConflictPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openAnimationShowcase() {
        app.openDashboardModule(AccessibilityIds.Dashboard.animationShowcase)
    }

    func openGestureConflicts() {
        app.openDashboardModule(AccessibilityIds.Dashboard.gestureConflicts)
    }

    func assertAnimationToggleAndReset() {
        openAnimationShowcase()

        app.tapButton(labeled: TestLabels.Animation.toggleFade)
        app.tapButton(labeled: TestLabels.Animation.reset)

        app.tapBackButton()
    }

    func assertZoomableImageAndScrollContent() {
        openGestureConflicts()

        app.assertElementVisible(identifier: AccessibilityIds.GestureConflict.zoomableImage)

        let first = app.element(identifier: AccessibilityIds.GestureConflict.contentItem(1))
        app.scrollUntilVisible(first)
        first.requirePresent(UITestDefaults.elementWait, "Scroll content")

        app.tapBackButton()
    }
}
