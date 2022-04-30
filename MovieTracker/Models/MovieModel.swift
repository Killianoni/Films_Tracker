//
//  MovieModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 20/04/2022.
//

import Foundation


// MARK: - Result
struct MovieResult: Codable {
	
	let page: Int?
	let results: [MovieResultElement]
	let totalPages, totalResults: Int?
	
	enum CodingKeys: String, CodingKey {
		case page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}

// MARK: - ResultElement
struct MovieResultElement: Codable {
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
