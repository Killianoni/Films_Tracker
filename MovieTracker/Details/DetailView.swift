//
//  DetailView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 30/04/2022.
//

import SwiftUI

struct DetailView: View {
	@ObservedObject private var vm = DetailViewModel()
	var id: String
    var body: some View {
		ZStack {
			AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(vm.movie?.posterPath ?? "Unknown")"), scale: 2) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fit)
				
			} placeholder: {
				ProgressView()
					.progressViewStyle(.circular)
			}
			.frame(width: 140, height: 200)
			Text(vm.movie?.title ?? "Unknown")
		}.onAppear {
			vm.getMovie(id)
		}
    }
}
