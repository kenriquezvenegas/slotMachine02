//
//  HexagonalUIView.swift
//  slotMachine02
//
//  Created by Beatriz Enríquez on 30/01/24.
//

import SwiftUI

struct HexagonalUIView: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let p1 = CGPoint(x: 0, y: 20)
            let p2 = CGPoint(x: 0, y: rect.height - 20)
            let p3 = CGPoint(x: rect.width/2 , y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height - 20)
            let p5 = CGPoint(x: rect.width, y: 20)
            let p6 = CGPoint(x: rect.width/2 , y: 0)
            
            path.move(to: p6)
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 13)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 13)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 13)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 13)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 13)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 13)
        }
    }
  
}

#Preview {
    HexagonalUIView()
        .frame(width: 100, height: 120, alignment: .center)
}
