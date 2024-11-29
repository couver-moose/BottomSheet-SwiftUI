//
//  ContentView.swift
//  BottomSheet
//
//  Created by Dario Daßler on 20.11.24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var sheet = true
    @State private var mapSelection = 0
    
    @State private var detent : PresentationDetent = .medium
    
    let cities = [
        "Berlin",
        "München",
        "Hamburg",
        "Köln",
        "Frankfurt am Main",
        "Stuttgart",
        "Düsseldorf",
        "Leipzig",
        "Dortmund",
        "Essen",
        "Bremen",
        "Dresden",
        "Hannover",
        "Nürnberg",
        "Duisburg",
        "Bochum",
        "Wuppertal",
        "Bielefeld",
        "Bonn",
        "Mannheim",
        "Karlsruhe",
        "Wiesbaden",
        "Augsburg",
        "Münster",
        "Gelsenkirchen",
        "Aachen",
        "Braunschweig",
        "Kiel",
        "Magdeburg",
        "Freiburg im Breisgau",
        "Lübeck",
        "Erfurt",
        "Rostock",
        "Mainz",
        "Kassel",
        "Saarbrücken",
        "Potsdam",
        "Koblenz",
        "Oldenburg"
    ]

    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                switch mapSelection {
                    case 0:
                        Map()
                        .navigationTitle("Karte")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    case 1:
                        VStack {
                            List(cities, id: \.self) { city in
                                NavigationLink(city) {
                                    Text("Wilkommen in: \(city)")
                                }
                            }
                        }
                    default:
                        Text("Error")
                }
                HStack {
                    Picker("mapselector", selection: $mapSelection) {
                        Image(systemName: "map").tag(0)
                        Image(systemName: "list.bullet").tag(1)
                    }.pickerStyle(.segmented)
                    .frame(width: 80)
                }
            }
        }
        .sheet(isPresented: $sheet) {
            TabView {
                
                VStack {
                    
                    Text("Deutschland")
                        .font(.title)
                        .padding()
                    List(cities, id: \.self) { city in
                        Text(city)
                            .listRowBackground(Color.clear)
                    }.scrollContentBackground(.hidden)
                }.tabItem {
                    Image(systemName: "backpack")
                }
                
                Text("...?")
                    .tabItem {
                        Image(systemName: "flame")
                    }
            }
            .presentationDetents([.height(150), .height(600), .medium], selection: $detent) //Fix punkte für das Sheet (mindestens zwei sonst funktioniert .presentationBackgroundInteraction(.enabled) nicht
            .presentationBackground(.ultraThinMaterial) //Hintergrund des Sheets
            .presentationCornerRadius(30) //Radius der Ecken
            .presentationBackgroundInteraction(.enabled(upThrough: .medium)) //Macht das Sheet zum BottomSHeet so kann man mit dem Hintergrund View interagieren
            .presentationDragIndicator(.visible) //Einstellung für den Drag indicator
            .interactiveDismissDisabled(true) //damit schließt sich das Sheet nicht durch nach unten wischen
        }

       
        
    }
}

#Preview {
    ContentView()
}
