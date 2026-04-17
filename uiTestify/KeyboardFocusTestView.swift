//
//  KeyboardFocusTestView.swift
//  uiTestify
//
//  Created by Aman Kumar on 24/05/25.
//

import SwiftUI

struct KeyboardFocusTestView: View {
    enum Field: Hashable {
        case username, email, password
    }

    @FocusState private var focusedField: Field?
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showSuccess = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Keyboard & Focus Test")
                .font(.title).bold()

            Group {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .username)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .email }
                    .accessibilityIdentifier("data-e2e-keyboard-username")

                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .password }
                    .accessibilityIdentifier("data-e2e-keyboard-email")

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                        showSuccess = true
                    }
                    .accessibilityIdentifier("data-e2e-keyboard-password")
            }

            Button("Submit") {
                focusedField = nil
                showSuccess = true
            }
            .disabled(!formValid)
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("data-e2e-keyboard-submit")

            if showSuccess {
                Label("Submitted successfully!", systemImage: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .accessibilityIdentifier("data-e2e-keyboard-success")
            }

            Spacer()
        }
        .padding()
        .onTapGesture {
            focusedField = nil // Dismiss keyboard
        }
        .navigationTitle("Keyboard & Focus")
    }

    private var formValid: Bool {
        !username.isEmpty && !email.isEmpty && !password.isEmpty
    }
}
