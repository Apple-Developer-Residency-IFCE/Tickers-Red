//
//  BottomSheet.swift
//  Tickers
//
//  Created by Alley Pereira on 08/06/23.
// https://stackoverflow.com/questions/56700752/swiftui-half-modal

import SwiftUI

/// Permite que apareça um BottonSheet até uma porcentagem da tela especificada
struct BottomSheet<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let sheetContent: () -> SheetContent
    var height: CGFloat
    
    init(isPresented: Binding<Bool>, sheetContent: @escaping () -> SheetContent, percentage: CGFloat = 0.5) {
        self._isPresented = isPresented
        self.sheetContent = sheetContent
        self.height = UIScreen.main.bounds.height * percentage
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    
                    sheetContent()
                        .frame(height: self.height)
                        .padding()
                        .background(
                            Color.white
                                .shadow(
                                    color: Color(white: 0.3).opacity(0.1),
                                    radius: 5,
                                    x: 0,
                                    y: -1
                                )
                        )
                        .roundedCorner(20, corners: [.topLeft, .topRight])
                }
                .zIndex(.infinity)
                .transition(.move(edge: .bottom))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
