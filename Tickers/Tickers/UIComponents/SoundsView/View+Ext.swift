//
//  View+Ext.swift
//  Tickers
//
//  Created by Alley Pereira on 08/06/23.
//

import SwiftUI

// MARK: - RoundedCorner
extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// MARK: - BottomSheet
extension View {
    func bottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        content: @escaping () -> SheetContent
    ) -> some View {
        self.modifier(BottomSheet(isPresented: isPresented, sheetContent: content))
    }
}
