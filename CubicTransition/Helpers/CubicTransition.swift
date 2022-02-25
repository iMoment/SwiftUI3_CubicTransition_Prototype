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
    
    // MARK: Animation Properties
    @State var animateView: Bool = false
    @State var showView: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 0) {
                content
                    .frame(width: size.width, height: size.height)
                
                // Rotate current view when detail view is pushing
                    .rotation3DEffect(.init(degrees: animateView ? -85 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing, anchorZ: 0, perspective: 1)
            }
            // Apply offset
            
        }
        .onChange(of: show) { newValue in
            // Using separate variable instead of show since it will be removed as soon as it is set to false; animation will not be completed
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(.easeInOut(duration: 0.35)) {
                    animateView.toggle()
                }
            }
        }
    }
}

struct CubicTransition_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
