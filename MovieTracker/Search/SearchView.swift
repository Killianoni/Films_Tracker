//
//  SearchView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct SearchView: View {
	@State private var searchText = ""
	
	var body: some View {
		NavigationView {
			Text("")
		}
		.searchable(text: $searchText)
		.navigationTitle("Search")
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
