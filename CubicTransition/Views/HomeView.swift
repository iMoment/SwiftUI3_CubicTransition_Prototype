//
//  HomeView.swift
//  CubicTransition
//
//  Created by Stanley Pan on 2022/02/25.
//

import SwiftUI

struct HomeView: View {
    @State var show: Bool = false
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            CubicTransition(show: $show) {
                ZStack {
                    Image("picture01")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                }
                
            } detail: {
                
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
