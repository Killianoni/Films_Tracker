//
//  HomeViewModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 06/04/2022.
//

import Foundation

class ViewModel: ObservableObject {
	
	// MARK: - Result
	struct Result: Codable {
		let page: Int?
		let results: [ResultElement]
		let totalPages, totalResults: Int?
		
		enum CodingKeys: String, CodingKey {
			case page, results
			case totalPages = "total_pages"
			case totalResults = "total_results"
		}
	}
	
	// MARK: - ResultElement
	struct ResultElement: Codable {
		let adult: Bool?
		let backdropPath: String
		let genreIDS: [Int]?
		let id: Int?
		let overview: String?
		let posterPath, releaseDate, title: String?
		let voteAverage: Double?
		let voteCount: Int?
		
		enum CodingKeys: String, CodingKey {
			case adult
			case backdropPath = "backdrop_path"
			case genreIDS = "genre_ids"
			case id
			case overview
			case posterPath = "poster_path"
			case releaseDate = "release_date"
			case title
			case voteAverage = "vote_average"
			case voteCount = "vote_count"
		}
	}
	
	enum OriginalLanguage: String, Codable {
		case fr = "fr"
	}
	
	init() {
		fetchPopular()
	}
	
	func fetchPopular() {
		let session = URLSession.shared
		
		let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5a47d30884f0c53a62a7eaa4f26a6973&language=fr-FR")
		
		var request = URLRequest(url: url!)
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
					let result = try jsonDecoder.decode(Result.self, from: data)
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
