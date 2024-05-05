//
//  CityCard.swift
//  Guidebook
//
//  Created by Hiren Gandhi on 4/13/24.
//

import SwiftUI

struct CityCard: View {
    
    var city: City
    
    var body: some View {
        
        ZStack{ //layered view
            //bottom or background elements
            Image(city.imageName)
                .resizable()
                .cornerRadius(15)
            
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
                .cornerRadius(15)
            //top most elements on the z stack
            VStack(alignment: .leading){
                
                Text(city.name)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Text(city.summary)
                    .multilineTextAlignment(.leading)
                
            }
            .padding()
            .foregroundColor(.white) //makes the text color white on the v stack only
            
        }
        .frame(height: 300) //limts the card view so it doesnt take up the entire view's height
        
        
    }
}

#Preview {
    CityCard(city: City(name: "Tokyo", summary: "Tsukiji Market is a major tourist attraction for both domestic and overseas visitors in Tokyo. The area contains retail markets, restaurants, and associated restaurant supply stores.", imageName: "Tokyo", attractions: [Attraction]()))
}
