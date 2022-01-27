//
//  TabView.swift
//  AppleLabProject
//
//  Created by Killian Adonaï on 18/01/2022.
//

import SwiftUI

struct TabBarView: View {
	@State private var selection: Int = 0
	
	init() {
		UITabBar.appearance().isOpaque = false
		UITabBar.appearance().unselectedItemTintColor = .lightGray
		UITabBar.appearance().backgroundColor = .black
		
		
		UITabBar.appearance().backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 0.8)

		
		
	}
	
	var body: some View {
		
		TabView(selection: $selection) {
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house")
				}.tag(1)
			
			SearchView()
				.tabItem {
					Label("Search", systemImage: "magnifyingglass")
				}.tag(2)
			
			MyListView()
				.tabItem {
					Label("My List", systemImage: "tv")
				}.tag(3)
			
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person")
				}.tag(4)

		}.preferredColorScheme(.dark)
	}
}

struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView()
	}
}
