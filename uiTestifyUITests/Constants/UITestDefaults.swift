//
//  UITestDefaults.swift
//  uiTestifyUITests
//
//  Single source of truth for default timeouts (DRY). Adjust here for slower CI/simulators.
//
import Foundation

enum UITestDefaults {
    /// Most element appearances (buttons, labels, fields).
    static let elementWait: TimeInterval = 5

    /// Quick checks (already on screen, subtitle text, etc.).
    static let shortWait: TimeInterval = 2

    /// Heavy screens, sheets, or flaky controls.
    static let longWait: TimeInterval = 10

    /// App launch / foreground.
    static let launchTimeout: TimeInterval = 15

    /// Navigation back, small UI chrome.
    static let interactionWait: TimeInterval = 2
}
