//
//  ContentView.swift
//  Meedies
//
//  Created by Misha Causur on 10.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isTappedEmailField = false
    @State private var isTappedPasswordField = false
    @State private var isEditEmailField = false
    @State private var isEditPasswordField = false
    var body: some View {
        ZStack {
            Image("backgroundMax")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sign up")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text("Get the all new data from around the world in the one place")
                        .font(.subheadline)
                        .foregroundColor(.white).opacity(0.7)
                    TextFieldComponent(isTapped: $isTappedEmailField, isEdit: $isEditEmailField, text: $email, iconName: "envelope", fieldName: "Email")
                    TextFieldComponent(isTapped: $isTappedPasswordField, isEdit: $isEditPasswordField, text: $password, iconName: "key", fieldName: "Password")
                    ButtonComponent()
                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.1))
                    VStack(alignment: .leading, spacing: 16) {
                        Button {
                            print("switched")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



struct TextFieldComponent: View {
    @Binding var isTapped: Bool
    @Binding var isEdit: Bool
    @Binding var text: String
    var iconName: String
    var fieldName: String
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: iconName)
                .frame(width: 20, height: 20)
                .padding(6)
                .background(.ultraThinMaterial).opacity(isTapped ? 1 : 0.5)
                .cornerRadius(16)
                .scaleEffect(isEdit ? 1.3 : 1)
                .foregroundColor(.white)
                .padding(.leading, 8)
            TextField(fieldName, text: $text) { isEditing in
                isTapped = isEditing
                if isEditing {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                        isEdit.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        isEdit.toggle()
                    }
                    
                }
                
            }
            .colorScheme(.dark)
            .foregroundColor(.white.opacity(0.8))
            .autocapitalization(.none)
            .textContentType(.emailAddress)
        }
        .frame(height: 42)
        .overlay(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(Color.white, lineWidth: 0.3)
                .blendMode(.overlay))
    }
}
