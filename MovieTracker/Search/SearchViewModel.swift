//
//  SearchViewModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 06/04/2022.
//

import Foundation

class SearchViewModel: ObservableObject {
	
	@Published var searchResult = [MovieResultElement]()
	
	
	func search(with query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
		let session = URLSession.shared
		
		guard let url = URL(string: "https://api.themoviedb.org/3/search/movie/?api_key=5a47d30884f0c53a62a7eaa4f26a6973&query=\(query)")
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
					let movieResults = try jsonDecoder.decode(MovieResult.self, from: data)
					self.searchResult = movieResults.results
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
