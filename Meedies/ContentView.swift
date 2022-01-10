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
                    Button {
                        print("tapped")
                    } label: {
                        GeometryReader { geometry in
                            ZStack {
                                AngularGradient(colors: [.pink, .purple, .orange], center: .center, angle: .degrees(0))
                                    .blendMode(.overlay)
                                    .blur(radius: 14)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                                            .frame(height: 42)
                                            .frame(maxWidth: geometry.size.width)
                                            .blur(radius: 14)
                                    }
                                Text("Sign in")
                                    .font(.headline.bold())
                                    .foregroundColor(.white.opacity(0.7))
                                    .frame(height: 42)
                                    .frame(maxWidth: geometry.size.width)
                                    .background(Color.pink.opacity(0.5))
                                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 0.3)
                                                .blendMode(.normal))
                                    .cornerRadius(30)
                            }
                        }
                        .frame(height: 42)
                    }
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
