//
//  RoundedCornerShape.swift
//  Tickers
//
//  Created by Alley Pereira on 08/06/23.
//

import SwiftUI

/// Define quais cantos especificos serão arredondados
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius)
        )
        return Path(path.cgPath)
    }

}
