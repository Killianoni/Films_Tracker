//
//  DetailViewModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 30/04/2022.
//

import Foundation
import CoreData

class DetailViewModel: ObservableObject {
	@Published var movie: SingleMovie?
	@Published var title: String = ""
	@Published var poster: String = ""
	@Published var id: Int64 = 0
	@Published var isFavorite: Bool = true
	@Published var favMovies = [Movie]()

	private let constants = Constants.shared
	
	func getMovie(_ id: String) {
		
		let session = URLSession.shared
		
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(constants.apiKey)&language=fr-FR")
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
	
	func addFavs() {
		let movieResult = DBManager.shared.addFavs(title: title, id: id, poster: poster, isFavorite: isFavorite)
		switch movieResult {
		case .success(let movie):
			print("Successfully added \(movie)")
		case .failure(let error):
			print(error.localizedDescription)
		}
	}
	
//	func deleteSong(with deleteMovieId: NSManagedObjectID) {
//		let res = DBManager.shared.deleteMovie(by: deleteMovieId)
//		switch res {
//		case .success:
//			favMovies = favMovies.filter { $0.objectID  != deleteMovieId }
//		case .failure: return
//		}
//	}
	
//	func fetchMovies() {
//		let moviesResult = DBManager.shared.getMovies(shouldFetchOnlyFavs: true)
//		switch moviesResult {
//		case .failure:               return
//		case .success(let movies):   self.favMovies = movies
//		}
//	}
	
}
