//
//  SearchView.swift
//  AppleLabProject
//
//  Created by Killian Adonaï on 18/01/2022.
//

import SwiftUI

struct SearchView: View {
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 15),
	]
	var body: some View {
		ZStack {
			Color(UIColor(white: 0.9, alpha: 0.1))
				.edgesIgnoringSafeArea(.all)
			ScrollView {
				VStack(alignment: .leading) {
					HStack{
						Button {
							print("")
						} label: {
							Image(systemName: "magnifyingglass")
							Text("Rechercher")
								.padding([.top, .bottom])
								.lineLimit(1)
							Spacer()
						}.foregroundColor(.white)
							.padding(.leading)
							.background(Color(white: 0.5))
							.cornerRadius(50)
							.padding(.bottom, 20)
						
					}
					.padding([.trailing, .leading])
					
					HStack {
						Text("Ajoutés recemment :")
					}
					.padding(.leading, 20)
					.padding(.bottom, 20)
					
					LazyVGrid(columns: columns, spacing: 30) {
						ForEach(0..<7) { _ in
							Button {
								print("")
							} label: {
								Image("DKR")
									.resizable()
									.scaledToFill()
									.frame(width: 160, height: 100)
									.cornerRadius(10)
									Spacer()
								
								Text("Batman Dark Knight Rises")
									.lineLimit(1)
									.foregroundColor(.white)
									.frame(width: 180, height: 100)
									
							}
							.padding(.bottom, 20)
							.padding([.trailing, .leading])
						}
					}
					
				}
			}
			
			.padding(.top, 20)
		}
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
			.preferredColorScheme(.dark)
	}
}
