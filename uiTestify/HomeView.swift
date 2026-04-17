//
//  HomevView.swift
//  uiTestify
//
//  Created by Aman Kumar on 24/05/25.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @AppStorage("autoRefresh") private var autoRefresh = true
    @State private var searchQuery = ""

    private let modules: [TestModule] = TestModule.all

    private var isUITestMode: Bool {
        ProcessInfo.processInfo.environment["UITEST_MODE"] == "1"
    }

    var filteredModules: [TestModule] {
        if searchQuery.isEmpty { return modules }
        return modules.filter { $0.title.localizedCaseInsensitiveContains(searchQuery) }
    }

    var body: some View {
        NavigationView {
            ZStack {
                (LinearGradient.uiTestifyGradient(forDarkMode: themeManager.isDarkMode))
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    // Profile & Toggles
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundStyle(.white)

                            VStack(alignment: .leading) {
                                Text("Hi, Test User!")
                                    .accessibilityIdentifier("data-e2e-username")
                                    .font(.title2).bold()
                                    .foregroundColor(.white)
                                Text("UI Testing Playground")
                                    .accessibilityIdentifier("data-e2e-subtitle")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)

                        VStack(spacing: 12) {
                            Toggle("Dark Mode", isOn: $themeManager.isDarkMode)
                                .toggleStyle(SwitchToggleStyle(tint: Color.primary(forDarkMode: themeManager.isDarkMode)))
                                .foregroundColor(.white)
                                .accessibilityIdentifier("data-e2e-home-dark-mode-toggle")
                                .accessibilityHint("Toggles app light and dark appearance")
                                .transaction { transaction in
                                    if isUITestMode { transaction.animation = nil }
                                }

                            Toggle("Auto Refresh", isOn: $autoRefresh)
                                .toggleStyle(SwitchToggleStyle(tint: Color.primary(forDarkMode: themeManager.isDarkMode)))
                                .foregroundColor(.white)
                                .accessibilityIdentifier("data-e2e-home-auto-refresh-toggle")
                                .transaction { transaction in
                                    if isUITestMode { transaction.animation = nil }
                                }
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                    }

                    // Search Bar
                    TextField("Search tests...", text: $searchQuery)
                        .padding(10)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .accessibilityIdentifier("data-e2e-home-search")

                    // Scrollable test modules
                    GeometryReader { geometry in
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(TestModuleCategory.allCases, id: \.self) { category in
                                    let sectionModules = filteredModules.filter { $0.category == category }

                                    if !sectionModules.isEmpty {
                                        AnimatedCategoryHeader(title: category.rawValue)
                                            .accessibilityIdentifier(DashboardModuleAccessibility.categoryIdentifier(for: category))

                                        ForEach(sectionModules) { module in
                                            NavigationLink(destination: module.destination) {
                                                Label(module.title, systemImage: module.icon)
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(Color.white.opacity(0.15))
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                                    .accessibilityIdentifier(DashboardModuleAccessibility.moduleIdentifier(forModuleTitle: module.title))

                                            }
                                        }
                                    }
                                }

                                Spacer(minLength: 20)
                            }
                            .padding(.top)
                            .frame(minHeight: geometry.size.height)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("UiTestify Dashboard")
                        .font(.title3)
                        .bold()
                        .accessibilityIdentifier("data-e2e-title")
                }
            }
            .navigationTitle("")
            }
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}
