//
//  AnimationGestureConflictTests.swift
//

import XCTest

final class AnimationGestureConflictTests: BaseTest {

    private var page: AnimationGestureConflictPage { AnimationGestureConflictPage(app: app) }

    func test_animationShowcase_toggleFade() {
        page.assertAnimationToggleAndReset()
    }

    func test_gestureConflict_zoomableImageAndScrollContent() {
        page.assertZoomableImageAndScrollContent()
    }
}
