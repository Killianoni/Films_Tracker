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
			Color(UIColor(white: 0.05, alpha: 1))
				.edgesIgnoringSafeArea(.all)
			Text(searchText)
		}
		.searchable(text: $searchText)
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
