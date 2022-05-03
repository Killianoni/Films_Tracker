//
//  HomeViewModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 06/04/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
	
	@Published var popularMovies = [MovieResultElement]()
	@Published var topRatedMovies = [MovieResultElement]()
	@Published var nowPlayingMovies = [MovieResultElement]()
	
	init() {
		fetchPopular()
		fetchTopRated()
		fetchNowplaying()
	}
	
	func fetchPopular() {
		
		let session = URLSession.shared
		
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5a47d30884f0c53a62a7eaa4f26a6973&language=fr-FR")
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
					self.popularMovies = movieResults.results
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
	
	func fetchTopRated() {
		
		let session = URLSession.shared
		
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=5a47d30884f0c53a62a7eaa4f26a6973&language=fr-FR")
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
					self.topRatedMovies = movieResults.results
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
	
	func fetchNowplaying() {
		
		let session = URLSession.shared
		
		guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=5a47d30884f0c53a62a7eaa4f26a6973&language=fr-FR")
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
					self.nowPlayingMovies = movieResults.results
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
