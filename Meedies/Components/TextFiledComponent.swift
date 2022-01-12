//
//  TextFiledComponent.swift
//  Meedies
//
//  Created by Misha Causur on 12.01.2022.
//

import SwiftUI

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
