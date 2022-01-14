//
//  SignInWAppleButtonComponent.swift
//  Meedies
//
//  Created by Misha Causur on 15.01.2022.
//

import SwiftUI
import AuthenticationServices

struct SignAppleButtinComponent: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
