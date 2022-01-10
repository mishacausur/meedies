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
                    HStack(spacing: 12) {
                        Image(systemName: "envelope")
                            .foregroundColor(.white)
                            .padding(.leading, 12)
                        TextField("Email", text: $email)
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
                    
                    HStack(spacing: 12) {
                        Image(systemName: "key")
                            .foregroundColor(.white)
                            .padding(.leading, 12)
                        SecureField("Password", text: $password)
                            .colorScheme(.dark)
                            .foregroundColor(.white.opacity(0.8))
                            .autocapitalization(.none)
                            .textContentType(.password)
                    }
                    .frame(height: 42)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(Color.white, lineWidth: 0.3)
                            .blendMode(.overlay))
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
