//
//  ContentView.swift
//  Meedies
//
//  Created by Misha Causur on 10.01.2022.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isTappedEmailField = false
    @State private var isTappedPasswordField = false
    @State private var isEditEmailField = false
    @State private var isEditPasswordField = false
    @State private var showProfile = false
    @State private var signinToggle = true
    var body: some View {
        ZStack {
            Image(signinToggle ? "backgroundMax" : "backgroundMax2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text(signinToggle ? "Sign up" : "Sign in")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text("Get the all new data from around the world in the one place")
                        .font(.subheadline)
                        .foregroundColor(.white).opacity(0.7)
                    TextFieldComponent(isTapped: $isTappedEmailField, isEdit: $isEditEmailField, text: $email, iconName: "envelope", fieldName: "Email")
                    TextFieldComponent(isTapped: $isTappedPasswordField, isEdit: $isEditPasswordField, text: $password, iconName: "key", fieldName: "Password")
                    ButtonComponent(title: signinToggle ? "Create account" : "Sign in") {
                        signup()
                    }
                    .onAppear {
                        Auth.auth().addStateDidChangeListener { auth, user in
                            if user != nil {
                                showProfile.toggle()
                            }
                        }
                    }
                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.1))
                    VStack(alignment: .leading, spacing: 16) {
                        Button {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1)) {
                                self.signinToggle.toggle()
                            }
                           
                        } label: {
                            HStack {
                                Text("Already have an account?")
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.7))
                                Text("Sign in")
                                    .font(.footnote.bold())
                                    .gradientForeground(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")])
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .background(.ultraThinMaterial)
                    .cornerRadius(30)
                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
                    )
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.white).opacity(0.7))
            .padding(.horizontal, 10)
        }
        .fullScreenCover(isPresented: $showProfile) {
            ProfileView()
        }
                        
    }
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else { return }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
