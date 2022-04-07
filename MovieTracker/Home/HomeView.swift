//
//  HomeView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject private var vm = ViewModel()
	var body: some View {
		ZStack {
			Color(UIColor(white: 0.05, alpha: 1))
				.edgesIgnoringSafeArea(.all)
			ScrollView {
				
				VStack(alignment: .leading) {
					
					Text("Populaires")
						.fontWeight(.bold)
						.padding(.leading)
						.font(.largeTitle)
					
					ScrollView(.horizontal, showsIndicators: false) {
						
						HStack(alignment: .center, spacing: 15) {
							
							ForEach(0..<8) { _ in
								Button {
									print("")
								} label: {
									//AsyncImage(url: URL(string: myURL))
									//.frame(width: 140, height: 180)
								}
								.cornerRadius(10)
							}
						}
						.padding(.leading)
					}
					
					Text("Mieux notés")
						.fontWeight(.bold)
						.padding(.leading)
						.font(.largeTitle)
					
					ScrollView(.horizontal, showsIndicators: false) {
						
						HStack(alignment: .center, spacing: 15) {
							
							ForEach(0..<8) { _ in
								Button {
									print("")
								} label: {
									//AsyncImage(url: URL(string: myURL))
									//.frame(width: 140, height: 180)
								}
								.cornerRadius(10)
							}
						}
						.padding(.leading)
					}
					
					Text("A venir")
						.fontWeight(.bold)
						.padding(.leading)
						.font(.largeTitle)
					
					ScrollView(.horizontal, showsIndicators: false) {
						
						HStack(alignment: .center, spacing: 15) {
							
							ForEach(0..<8) { _ in
								Button {
									print("")
								} label: {
									//AsyncImage(url: URL(string: myURL))
									//.frame(width: 140, height: 180)
								}
								.cornerRadius(10)
								.padding(.bottom, 20)
							}
						}
						.padding(.leading)
					}
				}
			}
			.padding(.top, 40)
		}.onAppear { vm.fetchPopular() }
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
