//
//  ContentView.swift
//  BottomSheet
//
//  Created by Dario Daßler on 20.11.24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var tapped = false
    @State private var sheet = true
    
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

        Map()
        .sheet(isPresented: $sheet) {
            VStack {
                Text("Deutschland")
                    .font(.title)
                    .padding()
                List(cities, id: \.self) { city in
                    Text(city)
                        .listRowBackground(Color.clear)
                }.scrollContentBackground(.hidden)
            }
            .presentationDetents([.height(80), .medium]) //Fix punkte für das Sheet (mindestens zwei sonst funktioniert .presentationBackgroundInteraction(.enabled) nicht
            .presentationBackground(.ultraThinMaterial) //Hintergrund des Sheets
            .presentationCornerRadius(30) //Radius der Ecken
            .presentationBackgroundInteraction(.enabled) //Macht das Sheet zum BottomSHeet so kann man mit dem Hintergrund View interagieren
            .presentationDragIndicator(.visible) //Einstellung für den Drag indicator
            .interactiveDismissDisabled(true) //damit schließt sich das Sheet nicht durch nach unten wischen
        }

       
        
    }
}

#Preview {
    ContentView()
}
