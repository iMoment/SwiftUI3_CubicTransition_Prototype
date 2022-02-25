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
                    
                    Button {
                        show.toggle()
                    } label: {
                        Text("Navigate")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                            .environment(\.colorScheme, .dark)
                    }
                }
                
            } detail: {
                Image("picture02")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }

        }
        .ignoresSafeArea()
        .overlay(alignment: .top) {
            HStack(spacing: 12) {
                if show {
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                }
                
                Text(show ? "Back" : "Cubic Transition")
                    .font(.title.bold())
                    .foregroundColor(Color.white)
            }
            .padding()
            .padding(.top, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
