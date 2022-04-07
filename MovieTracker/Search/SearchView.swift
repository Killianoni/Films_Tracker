//
//  SearchView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct SearchView: View {
	@State private var searchText = ""
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 15),
	]
	var body: some View {
		ZStack {
			Color(UIColor(white: 0.05, alpha: 0.1))
				.edgesIgnoringSafeArea(.all)
			ScrollView {
				VStack(alignment: .leading) {
					HStack {
						Text("Ajoutés recemment :")
							.fontWeight(.bold)
					}
					LazyVGrid(columns: columns, spacing: 30) {
						ForEach(0..<7) { _ in
							Button {
								print("")
							} label: {
								//AsyncImage(url: URL(string: myURL))
									//.frame(width: 160, height: 100)
									//.cornerRadius(10)
								Spacer()
								
								Text("<Nom du Film>")
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
