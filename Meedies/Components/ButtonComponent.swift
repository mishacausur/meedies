//
//  ButtonComponent.swift
//  Meedies
//
//  Created by Misha Causur on 11.01.2022.
//

import SwiftUI

struct ButtonComponent: View {
    @State private var angle: Double = 180.0
    var title: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            GeometryReader { geometry in
                ZStack {
                    AngularGradient(colors: [.pink, .orange, .red, .pink, .orange], center: .center, angle: .degrees(angle))
                        .blendMode(.overlay)
                        .blur(radius: 14)
                        .mask {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .frame(height: 42)
                                .frame(maxWidth: geometry.size.width)
                                .blur(radius: 14)
                        }
                        .onAppear() {
                            withAnimation(.linear(duration: 7).repeatForever(autoreverses: false)) {
                                self.angle += 350
                            }
                        }
                    Text(title)
                        .font(.headline.weight(.heavy))
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
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(title: "Title") {
            
        }
    }
}
