//
//  MyListViewModel.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 06/04/2022.
//

import Foundation
import CoreData

class MyListViewModel: ObservableObject {
	
	@Published var favMovies = [Movie]()
	
	init() {
		fetchMovies()
	}
	
	func fetchMovies() {
		let moviesResult = DBManager.shared.getMovies(shouldFetchOnlyFavs: true)
		switch moviesResult {
		case .failure:               return
		case .success(let movies):   self.favMovies = movies
		}
	}
	
	func deleteSong(with deleteMovieId: NSManagedObjectID) {
		let res = DBManager.shared.deleteMovie(by: deleteMovieId)
		switch res {
		case .success:
			favMovies = favMovies.filter { $0.objectID  != deleteMovieId }
		case .failure: return
		}
	}
}
