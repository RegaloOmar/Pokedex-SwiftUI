//
//  LoaderCellUI.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 14/01/25.
//

import SwiftUI

struct LoaderCellUI: View {
    
    @State private var rotatePokeball = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color(.systemGray))
            
            VStack{
                Spacer()
                
                HStack(spacing: 30) {
                    
                    Image("pokeball.logo.color")
                        .resizable()
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.degrees(rotatePokeball ? 360 : 0))
                        .animation(.linear(duration: 2)
                            .repeatForever(autoreverses: false), 
                                   value: rotatePokeball)
                        .onAppear {
                            rotatePokeball = true
                    }
                
                    Image("pokeball.logo.color")
                        .resizable()
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.degrees(rotatePokeball ? 360 : 0))
                        .animation(.linear(duration: 2)
                            .repeatForever(autoreverses: false),
                                   value: rotatePokeball)
                        .onAppear {
                            rotatePokeball = true
                    }
                    
                    Image("pokeball.logo.color")
                        .resizable()
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.degrees(rotatePokeball ? 360 : 0))
                        .animation(.linear(duration: 2)
                            .repeatForever(autoreverses: false),
                                   value: rotatePokeball)
                        .onAppear {
                            rotatePokeball = true
                    }
                }
                .padding(.vertical)
                
                Text("Loading...")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
            }
        }
            
    }
}

#Preview {
    LoaderCellUI()
}
