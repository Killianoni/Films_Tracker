//
//  HomeView.swift
//  AppleLabProject
//
//  Created by Killian Adonaï on 18/01/2022.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		ZStack {
			Color(UIColor(white: 0.9, alpha: 0.1))
				.edgesIgnoringSafeArea(.all)
			ScrollView {
				
				VStack(alignment: .leading) {
					Text("Continuer :")
						.padding(.leading)
						.font(.largeTitle)
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(alignment: .center, spacing: 15) {
							ForEach(0..<8) { _ in
								Button {
									print("")
								} label: {
									Image("DKR")
										.resizable()
										.scaledToFit()
										.frame(width: 140, height: 180)
								}
								.cornerRadius(10)
							}
						}
						.padding(.leading)
					}
					
					Text("Dans votre liste :")
						.padding(.leading)
						.font(.largeTitle)
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(alignment: .center, spacing: 15) {
							ForEach(0..<8) { _ in
								Button {
									print("")
								} label: {
									Image("DKR")
										.resizable()
										.scaledToFit()
										.frame(width: 140, height: 180)
								}
								.cornerRadius(10)
							}
						}
						.padding(.leading)
					}
					
					Text("Recommandations :")
						.padding(.leading)
						.font(.largeTitle)
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(alignment: .center, spacing: 15) {
							ForEach(0..<8) { _ in
								Button {
									print("")
								} label: {
									Image("DKR")
										.resizable()
										.scaledToFit()
										.frame(width: 140, height: 180)
								}
								.cornerRadius(10)
								.padding(.bottom, 20)
							}
						}
						.padding(.leading)
					}
				}
			}
			.padding(.top, 20)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.preferredColorScheme(.dark)
	}
}
