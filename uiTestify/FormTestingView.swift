//
//  FormTestingView.swift
//  uiTestify
//
//  Created by Aman Kumar on 24/05/25.
//

import SwiftUI

struct FormTestingView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var agreeToTerms = false
    @State private var selectedRole = "Tester"
    @State private var submitted = false
    @State private var showValidationError = false

    private let roles = ["Tester", "Developer", "Designer", "Manager"]

    var body: some View {
        Form {
            Section(header: Text("User Info")) {
                TextField("Name", text: $name)
                    .accessibilityIdentifier("data-e2e-form-name")
                    .autocapitalization(.words)

                TextField("Email", text: $email)
                    .accessibilityIdentifier("data-e2e-form-email")
                    .keyboardType(.emailAddress)
            }

            Section(header: Text("Preferences")) {
                Picker("Role", selection: $selectedRole) {
                    ForEach(roles, id: \.self) { role in
                        Text(role)
                    }
                }
                .accessibilityIdentifier("data-e2e-form-role")

                Toggle("Agree to Terms", isOn: $agreeToTerms)
                    .accessibilityIdentifier("data-e2e-form-terms-toggle")
            }

            Section {
                Button("Submit") {
                    if formIsValid {
                        submitted = true
                        showValidationError = false
                        hideKeyboard()
                    } else {
                        submitted = false
                        showValidationError = true
                    }
                }
                .accessibilityIdentifier("data-e2e-form-submit")
                .buttonStyle(.borderedProminent)
            }

            if submitted {
                Section {
                    Label("Form submitted successfully!", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .accessibilityIdentifier("data-e2e-form-success")
                }
            }

            if showValidationError {
                Section {
                    Label("Please fill in all fields and agree to terms.", systemImage: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .accessibilityIdentifier("data-e2e-form-error")
                }
            }
        }
        .navigationTitle("Form Test")
    }

    private var formIsValid: Bool {
        !name.isEmpty && !email.isEmpty && agreeToTerms
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
