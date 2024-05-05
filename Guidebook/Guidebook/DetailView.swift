//
//  DetailView.swift
//  Guidebook
//
//  Created by Hiren Gandhi on 4/12/24.
//

import SwiftUI

struct DetailView: View { //CityView -> AttractionsView -> DeatilView on the navigation
    
    var attraction: Attraction
    
    var body: some View {
        
        VStack(spacing: 20){
            Image(attraction.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            
            ScrollView{
                VStack(alignment: .leading, spacing: 20) {
                    Text(attraction.name)
                        .font(.title)
                        .bold()
                    
                    Text(attraction.longDescription)
                        .multilineTextAlignment(.leading)
                    
                    Button(action: {
                        
                        //Create URL instance based on URL scheme using map 
                        if let url = URL(string: "maps://?q=\(attraction.name.replacingOccurrences(of: " ", with: "+"))&sll=\(attraction.latLong.trimmingCharacters(in: .whitespaces))&z=10&t=s") {
                            //Test if URL can be opened
                            if UIApplication.shared.canOpenURL(url){
                                //Open the URL
                                UIApplication.shared.open(url)
                            }
                        }
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.blue)
                                .frame(height: 40)
                            
                            Text("Get Directions")
                                .foregroundColor(.white)
                        }
                    })
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
        
        
    }
    
    
    
}


#Preview {
    DetailView(attraction: Attraction(name: "Pantheon",
                                      summary: "The Pantheon is a former Roman temple and, since 609 AD, a Catholic church in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
                                      longDescription: """
   The Pantheon from Greek is a former Roman temple and, since 609 AD, a Catholic church (Basilica di Santa Maria ad Martyres or Basilica of St. Mary and the Martyrs) in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus (27 BC – 14 AD). It was rebuilt by the emperor Hadrian and probably dedicated c. 126 AD. Its date of construction is uncertain, because Hadrian chose not to inscribe the new temple but rather to retain the inscription of Agrippa's older temple, which had burned down.
   """,
                                      imageName: "pantheon", latLong: "41.898762500696236, 12.476915812472798"))
}
