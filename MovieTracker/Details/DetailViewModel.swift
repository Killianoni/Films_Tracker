//
//  DetailViewModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 30/04/2022.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var movie: SingleMovie?

	func getMovie(_ id: String) {
		
		let session = URLSession.shared
		
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=70d695698e1725917ed1fa6d935de2e5&language=en-EN")
		else { return }
		
		var request = URLRequest(url: url)
		request.setValue(
			"application/json;charset=utf-8",
			forHTTPHeaderField: "Content-Type"
		)
		
		let task = session.dataTask(with: request) { data, response, error in
			if let data = data {
				print(data)
				let jsonDecoder = JSONDecoder()
				jsonDecoder.dateDecodingStrategy = .secondsSince1970
				do {
					let result = try jsonDecoder.decode(SingleMovie.self, from: data)
					self.movie = result
				} catch {
					print(error.localizedDescription)
				}
			}
			if let error = error {
				print(error.localizedDescription)
			}
		}
		
		task.resume()
	}
}
