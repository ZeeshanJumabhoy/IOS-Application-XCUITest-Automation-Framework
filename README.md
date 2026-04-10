# UiTestify (iOS) — UI playground with XCUITest automation

**UiTestify** is a SwiftUI sample app that acts as a **UI testing playground**: a dashboard links to many small feature screens (gestures, forms, lists, dialogs, async loading, navigation, accessibility, and more). This repository extends the original project with a **structured XCUITest suite**, shared helpers, and **page objects** so the tests read like product flows rather than raw `XCUIElement` calls.

---

## Upstream credit

The **app shell and front-end screens** come from the open project **[UiTestify-iOS](https://github.com/codedbyaman/UiTestify-iOS)** by **codedbyaman**. That upstream README described an older UIKit-style “quiz” narrative; **this fork’s app is a SwiftUI dashboard with modular demo screens**. The work here focuses on **automation**: `uiTestifyUITests`, stability tweaks in the app for UI test mode, and documentation.

If you use this repo, please retain attribution to the original author and link to the upstream repository.

---

## What this project is for

| Audience | Use |
|----------|-----|
| **Developers / QA** | Learn **XCUITest**, accessibility identifiers, scrolling, alerts, sheets, toggles, and async UI. |
| **Teams** | Reuse the **folder layout** (`Base` → `Support` → `Pages` → `Tests`) as a template for larger apps. |

The app is not a production product; it is a **deliberately dense UI surface** so tests can exercise many patterns in one codebase.

---

## Tech stack

- **Swift**, **SwiftUI** (main app)
- **XCTest / XCUITest** (UI tests)
- **Xcode** 15+ recommended (match your simulator runtime)

---

## Running the app and tests

1. Clone this repository and open **`uiTestify.xcodeproj`** in Xcode.
2. Select an **iOS Simulator** (e.g. iPhone 15 or 16).
3. **Run the app:** `⌘R`
4. **Run all UI tests:** `⌘U`  
   Or use the **Test navigator** (⌘6) and run a single class or test method.

**UI test launch configuration** (see `Base/BaseTest.swift`):

- Launch argument: `-ui_testing`
- Environment variable: `UITEST_MODE` = `1`  
  Used by the app to reduce flakiness (e.g. animations / theming) during automation.

---

## `uiTestifyUITests` — layout and responsibilities

Tests are organized so that **identifiers, timeouts, and gestures live in one place**, and **each screen has a page object**.

```
uiTestifyUITests/
├── Base/
│   └── BaseTest.swift              # XCTestCase subclass: launches app, UITEST_MODE, exposes `homePage`
├── Support/
│   ├── Constants/
│   │   ├── AccessibilityIds.swift  # All accessibility identifiers (single source of truth)
│   │   ├── UITestDefaults.swift    # Default timeouts (element, short, long, launch, …)
│   │   ├── TestData.swift          # Typed strings used as input in tests
│   │   └── TestLabels.swift        # Visible labels / alert titles where needed
│   └── Helpers/
│       ├── UITestActions.swift     # wait → assert → tap / type (DRY interaction layer)
│       └── UITestHelpers.swift     # App extensions: scroll-until-visible, open dashboard modules,
│       #                             keyboard dismiss, SwiftUI toggle helpers, etc.
├── Pages/
│   ├── HomePage.swift
│   ├── GesturePlaygroundPage.swift
│   ├── FormFlowPage.swift
│   ├── ListDialogPage.swift
│   ├── KeyboardNavigationPage.swift
│   ├── AsyncLoadingPage.swift
│   ├── NetworkPerformancePage.swift
│   ├── AccessibilityTabBarPage.swift
│   └── AnimationGestureConflictPage.swift
└── Tests/
    ├── SmokeTests.swift
    ├── HomeDashboardTests.swift
    ├── GesturePlaygroundTests.swift
    ├── FormFlowTests.swift
    ├── ListAndDialogTests.swift
    ├── KeyboardAndNavigationTests.swift
    ├── AsyncNetworkPerformanceTests.swift
    ├── AccessibilityTabBarTests.swift
    └── AnimationGestureConflictTests.swift
```

### Design principles

- **Page Object Model (POM):** `Tests/*` stay thin; navigation and assertions live in `Pages/*`.
- **DRY:** `UITestActions` centralizes “wait then tap / type”; `UITestDefaults` centralizes timeouts.
- **Stable SwiftUI toggles:** SwiftUI often nests the real `Switch` inside a labeled container. Helpers such as `tapSwiftUIToggleUntilValueChanges` / `tapSwiftUIToggleRow` retry until the toggle value changes instead of a single blind `tap()`.

---

## Test suites (what each file covers)

| Test target | What it validates |
|-------------|-------------------|
| **SmokeTests** | App reaches foreground; main dashboard is visible. |
| **HomeDashboardTests** | Greeting/subtitle; search filters dashboard rows; dark mode toggle; category headers (with scroll). |
| **GesturePlaygroundTests** | Tap / long-press / double-tap demo areas and expected UI feedback. |
| **FormFlowTests** | Form validation error → success; multi-step form wizard through confirmation. |
| **ListAndDialogTests** | List row selection + selected state; alert + confirmation dialog; modal sheet dismiss + toast. |
| **KeyboardAndNavigationTests** | Keyboard-focused fields and submit; short multi-step navigation flow. |
| **AsyncNetworkPerformanceTests** | Async loading to a terminal state; network toggle + retry; heavy list / search performance scenario. |
| **AccessibilityTabBarTests** | Accessibility demo screen controls; tab bar switching + badge toggle. |
| **AnimationGestureConflictTests** | Animation toggle; zoomable content vs scroll conflict. |

Identifiers for buttons and fields are defined in **`Support/Constants/AccessibilityIds.swift`** and should stay in sync with the SwiftUI `accessibilityIdentifier` values in the app.

---

## Optional second UI target

The project may include **`uiTestifyUITests2`** as a separate UI test bundle (template / experiments). The main automation described above lives in **`uiTestifyUITests`**.

---

## Contributing

Issues and pull requests are welcome. Prefer changes that:

1. Keep **accessibility identifiers** stable or update `AccessibilityIds.swift` in the same change.
2. Add or adjust **page object** methods instead of growing test methods with raw queries.
3. Respect **UITEST_MODE** for anything that makes CI/simulators flaky (animations, delays).

---

## Learning resources

- [UI testing with Xcode](https://developer.apple.com/documentation/xctest/user_interface_tests) — Apple documentation for XCUITest  
- [Hacking with Swift – UI Testing](https://www.hackingwithswift.com/read/30/overview) — approachable introduction  

---

## License

Check the repository for a **LICENSE** file. The upstream project ([UiTestify-iOS](https://github.com/codedbyaman/UiTestify-iOS)) is described there as MIT; ensure your distribution complies with upstream terms.

---

## Acknowledgements

- **Original app / framework:** [codedbyaman / UiTestify-iOS](https://github.com/codedbyaman/UiTestify-iOS)  
- **XCUITest structure, helpers, and expanded scenarios:** contributions in this fork’s `uiTestifyUITests` tree.

Happy testing.
