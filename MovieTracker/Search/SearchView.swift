//
//  SearchView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct SearchView: View {
	@StateObject private var vm = SearchViewModel()
	@State private var searchText: String = ""
	
	var body: some View {
		NavigationView {
			//			List(vm.searchResult) { movie in
			//			Text(movie.title)
			//			}.listStyle(.plain)
			//				.searchable(text: $searchText)
			//				.onChange(of: searchText) { value in
			//					print(value)
			//
			//		}
		}
	}
}
