//
//  ContentView.swift
//  Guidebook
//
//  Created by Hiren Gandhi on 4/12/24.
//

import SwiftUI

struct CityView: View { //starting base layer of the navigation
    
    @State var cities = [City]()
    var dataService = DataService()
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                VStack {
                    
                    ForEach(cities) { city in
                        
                        NavigationLink { //points to the next destination
                            AttractionsView(city: city) //destination View
                        } label: {
                            CityCard(city: city) //uses the custom layout to display city information
                                .padding(.bottom, 20)
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
            .ignoresSafeArea() //content goes beyond the top and bottom edges
            .onAppear(){
                cities = dataService.getFileData()
            }
        }
    }
}

#Preview {
    CityView()
}
