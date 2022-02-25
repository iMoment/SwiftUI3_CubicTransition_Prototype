//
//  CubicTransition.swift
//  CubicTransition
//
//  Created by Stanley Pan on 2022/02/25.
//

import SwiftUI

struct CubicTransition<Content: View, Detail: View>: View {
    var content: Content
    var detail: Detail
    
    // MARK: Show View
    @Binding var show: Bool
    
    init(show: Binding<Bool>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder detail: @escaping () -> Detail) {
        self.detail = detail()
        self.content = content()
        self._show = show
    }
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
        }
    }
}

struct CubicTransition_Previews: PreviewProvider {
    static var previews: some View {
        CubicTransition()
    }
}
