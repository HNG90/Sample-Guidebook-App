//
//  AttractionsView.swift
//  Guidebook
//
//  Created by Hiren Gandhi on 4/12/24.
//

import SwiftUI

struct AttractionsView: View { //CityView -> AttractionsView second layer on the navigation
    
    var city: City
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                
                ForEach(city.attractions) { attraction in
                    
                    NavigationLink { // Next destination on the navigation
                        DetailView(attraction: attraction)
                    } label: {
                        AttractionRow(attraction: attraction)
                    }
                    .buttonStyle(.plain)
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    AttractionsView(city: City(name: "Rome",
                               summary: "Rome is the capital city of Italy. It is also the capital of the Lazio region, the centre of the Metropolitan City of Rome, and a special comune named Comune di Roma Capitale.",
                               imageName: "rome",
                               attractions: [
                                  Attraction(name: "Pantheon",
                                             summary: "The Pantheon is a former Roman temple and, since 609 AD, a Catholic church in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
                                             longDescription: """
          The Pantheon from Greek is a former Roman temple and, since 609 AD, a Catholic church (Basilica di Santa Maria ad Martyres or Basilica of St. Mary and the Martyrs) in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus (27 BC – 14 AD). It was rebuilt by the emperor Hadrian and probably dedicated c. 126 AD. Its date of construction is uncertain, because Hadrian chose not to inscribe the new temple but rather to retain the inscription of Agrippa's older temple, which had burned down.
          """,
                                             imageName: "pantheon", latLong: "41.898762500696236, 12.476915812472798")
                               ]))
}
