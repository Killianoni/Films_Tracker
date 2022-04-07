//
//  Movie.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 23/03/2022.
//

import Foundation

struct MovieResponse: Decodable {
	let results: [Movie]
}

struct Movie: Decodable {
	let id: Int
	let title: String
	let backdropPath: String?
	let posterPath: String?
	let overview: String
	let voteAverage: Double
	let voteCount: Int
	let runtime: Int?
	let releaseDate: Date?
	let status: String
	
	var backdropURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
	}
}
