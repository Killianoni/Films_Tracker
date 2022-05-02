//
//  HomeView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject private var vm = HomeViewModel()
	
	var body: some View {
		NavigationView {
			ZStack {
				Color(UIColor(white: 0.05, alpha: 1))
					.edgesIgnoringSafeArea(.all)
				ScrollView {
					
					VStack(alignment: .leading) {
						
						Text("Populaires")
							.font(.custom("Arial",size: 25, relativeTo: .headline))
							.fontWeight(.bold)
							.padding(.leading)
							.font(.largeTitle)
						
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(alignment: .center, spacing: 15) {
								
								ForEach(vm.popularMovies, id: \.id) { movie in
									NavigationLink(destination: DetailView(id: String(movie.id)),
									label: {
										AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "Unknown")"), scale: 2) { image in
											image
												.resizable()
												.aspectRatio(contentMode: .fit)
											
										} placeholder: {
											ProgressView()
												.progressViewStyle(.circular)
										}
										.frame(width: 140, height: 200)
									})
									.cornerRadius(10)
								}
							}
							.padding(.leading)
							
						}
						.padding(.bottom)
						
						Text("Prochainement")
							.font(.custom("Arial",size: 25, relativeTo: .headline))
							.fontWeight(.bold)
							.padding(.leading)
							.font(.largeTitle)
						
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(alignment: .center, spacing: 15) {
								
								ForEach(vm.upcomingMovies, id: \.id) { movie in
									NavigationLink(destination: DetailView(id: String(movie.id)),
									label: {
										AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "Unknown")"), scale: 2) { image in
											image
												.resizable()
												.aspectRatio(contentMode: .fit)
										} placeholder: {
											ProgressView()
												.progressViewStyle(.circular)
										}
										.frame(width: 140, height: 200)
										
									})
									.cornerRadius(10)
								}
							}
							.padding(.leading)
						}
						.padding(.bottom)
						
						Text("Mieux notés")
							.font(.custom("Arial",size: 25, relativeTo: .headline))
							.fontWeight(.bold)
							.padding(.leading)
							.font(.largeTitle)
						
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(alignment: .center, spacing: 15) {
								
								ForEach(vm.topRatedMovies, id: \.id) { movie in
									NavigationLink(destination: DetailView(id: String(movie.id)),
									label: {
										AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "Unknown")"), scale: 2) { image in
											image
												.resizable()
												.aspectRatio(contentMode: .fit)
										} placeholder: {
											ProgressView()
												.progressViewStyle(.circular)
										}
										.frame(width: 140, height: 200)
										
									})
									.cornerRadius(10)
									.padding(.bottom, 20)
								}
							}
							.padding(.leading)
						}
					}
				}
				.padding(.top, 40)
			}
			.onAppear {
				vm.fetchPopular()
				vm.fetchTopRated()
				vm.fetchUpcoming()
			}
			.navigationBarTitle("", displayMode: .inline)
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
		}
		
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
