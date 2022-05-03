//
//  DetailView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 30/04/2022.
//

import SwiftUI
import CoreData

struct DetailView: View {
	@ObservedObject private var vm = DetailViewModel()
	var id: String
	
	@State private var isExpanded: Bool = false
	var body: some View {
		ZStack {
			Color(UIColor(white: 0.05, alpha: 1))
				.edgesIgnoringSafeArea(.all)
			ScrollView {
				VStack {
					AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(vm.movie?.backdropPath ?? "Unknown")"), scale: 2) { image in
						image
							.resizable()
							.aspectRatio(contentMode: .fit)
							.edgesIgnoringSafeArea(.all)
						
					} placeholder: {
						ProgressView()
							.progressViewStyle(.circular)
					}.padding(.bottom)
					
					HStack {
						Text(vm.movie?.title ?? "Loading...")
							.font(.custom("Arial",size: 25, relativeTo: .headline))
							.fontWeight(.bold)
							.padding(.leading, 20)
						Spacer()
						Text("⭐️ \(String(vm.movie?.voteAverage ?? 0))/10")
							.padding(.trailing, 20)
					}.padding(.bottom)
					
//					HStack {
//						ForEach(vm.movie?.genres) { genre in
//							Text(genre.title)
//						}
//					}.padding(.bottom)
					
					HStack {
						Text(vm.movie?.overview ?? "Unknown")
							.padding([.trailing,.leading])
							.lineLimit(isExpanded ? nil : 4)
										.overlay(
											GeometryReader { proxy in
												Button(action: {
													isExpanded.toggle()
												}) {
													Text(isExpanded ? "Less" : "More")
														.font(.caption).bold()
														.padding([.trailing,.leading])
														.padding(.top, 4.0)
														.background(Color(UIColor(white: 0.05, alpha: 1)))
												}
												.frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
											}
										)
					}
					.padding(.bottom)
					HStack {
						Text("⌚️ \(String(vm.movie?.runtime ?? 0))")
							.padding(.leading, 20)
						Spacer()
						Text("📆 \(vm.movie?.releaseDate ?? "Loading...")")
							.padding(.trailing, 20)
					}.padding(.bottom)
					
					HStack {
			
						Button {
							vm.title = vm.movie?.title ?? "Unknown"
							vm.poster = vm.movie?.posterPath ?? "Unknown"
							vm.id = Int64(vm.movie?.id ?? 0)
							vm.addFavs()
						} label: {
							Text("A voir")
								.fontWeight(.bold)
								.padding(8)
								.foregroundColor(.white)
								.background(Color.red)
								.cornerRadius(10)
						}
						
//						Button {
//							vm.deleteSong(with: NSManagedObjectID(vm.movie?.id))
//						} label: {
//							Text("Delete")
//								.fontWeight(.bold)
//								.padding(8)
//								.foregroundColor(.white)
//								.background(Color.red)
//								.cornerRadius(10)
//						}
						
					}
					
					
					Spacer()
				}
			}
			.edgesIgnoringSafeArea(.all)
		}.onAppear {
			vm.getMovie(id)
			vm.fetchMovies()
		   }
	}
	
	struct DetailView_Previews: PreviewProvider {
		static var previews: some View {
			DetailView(id: "664413")
		}
	}
	
}
