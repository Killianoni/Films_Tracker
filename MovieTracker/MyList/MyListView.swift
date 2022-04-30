//
//  MyListView.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

struct MyListView: View {
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 10),
		GridItem(.flexible(), spacing: 10),
		GridItem(.flexible(), spacing: 10),
	]
	var body: some View {
		ZStack {
			Color(UIColor(white: 0.05, alpha: 0.1))
				.edgesIgnoringSafeArea(.all)
			ScrollView {
				VStack {
					LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
						ForEach(0..<15) { _ in
							Button {
								print("")
							} label: {
								//AsyncImage(url: URL(string: myURL))
									//.frame(width: 110, height: 170)
							}
							.cornerRadius(9)
						}
					}
					.padding(.bottom, 20)
				}
				.padding([.trailing, .leading])
				.padding(.top, 20)
			}
		}
	}
}

struct MyListView_Previews: PreviewProvider {
	static var previews: some View {
		MyListView()
			.preferredColorScheme(.dark)
	}
}
