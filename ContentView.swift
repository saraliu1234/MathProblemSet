//
//  ContentView.swift
//  PutnamPreperation
//
//  Created by Lanqing Liu on 2026-09-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: Constants.homeIconString){
                Text(Constants.homeString)
            }
            Tab(Constants.favoriteString, systemImage: Constants.favoriteIconString){
                Text(Constants.favoriteString)
            }
            Tab(Constants.libraryString, systemImage: Constants.libraryIconString){
                LibraryView()
            }
        }
    }
}

#Preview {
    ContentView()
}
