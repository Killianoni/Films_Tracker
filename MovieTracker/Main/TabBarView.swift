//
//  TabBarView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct TabBarView: View {
	@State private var selection: Int = 0


    var body: some View {
		TabView(selection: $selection) {
			HomeView()
				.tabItem { Label("Home", systemImage: "house")}
			SearchView()
				.tabItem { Label("Search", systemImage: "magnifyingglass")}
			MyListView()
				.tabItem { Label("My List", systemImage: "square.grid.3x3")}
			ProfileView()
				.tabItem { Label("Profile", systemImage: "person")}
		}
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
			TabBarView()
    }
}
