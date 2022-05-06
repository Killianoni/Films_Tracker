//
//  MyListView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct MyListView: View {
	@ObservedObject private var vm = MyListViewModel()
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 10),
		GridItem(.flexible(), spacing: 10),
		GridItem(.flexible(), spacing: 10),
	]
	var body: some View {
		NavigationView {
			ZStack {
				ScrollView {
					Color(UIColor(white: 0.05, alpha: 0.1))
						.edgesIgnoringSafeArea(.all)
					LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
						ForEach(vm.favMovies) { movie in
							Button {
								vm.deleteSong(with: movie.objectID)
							} label: {
								AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.poster ?? "Unknown")"), scale: 2) { image in
									image
										.resizable()
										.aspectRatio(contentMode: .fit)
										.cornerRadius(8)
								} placeholder: {
									ProgressView()
										.progressViewStyle(.circular)
								}
								.frame(width: 130, height: 160)
								
							}
							
						}
						.padding(.bottom, 20)
					}
					.padding([.trailing, .leading])
					.padding(.top, 20)
				}
			}.onAppear {
				vm.fetchMovies()
			}.navigationTitle("Ma Liste")
		}
	}
}

struct MyListView_Previews: PreviewProvider {
	static var previews: some View {
		MyListView()
	}
}
