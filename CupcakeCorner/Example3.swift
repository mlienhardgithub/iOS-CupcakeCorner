//
//  Example3.swift
//  CupcakeCorner
//
//  Created by Martin Lienhard on 6/9/24.
//

import SwiftUI

struct Example3: View {
    @State private var username = "";
    @State private var email = "";
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    Example3()
}
