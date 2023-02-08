//
//  RoundedShape.swift
//  What to Eat
//
//  Created by Chris Lang on 2/6/23.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 200, height: 200))
        return Path(path.cgPath)
    }
}
