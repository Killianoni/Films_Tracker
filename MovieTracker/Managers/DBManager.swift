//
//  DBManager.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import CoreData
import Foundation

struct DBManager {
	static let shared = DBManager()

	let container: NSPersistentContainer

	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "MovieTracker")
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		container.viewContext.automaticallyMergesChangesFromParent = true
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
	}
	
	func addFavs(
		title: String,
		id: Int64,
		poster: String,
		isFavorite: Bool,
		MovieId: NSManagedObjectID? = nil
	) -> Result<Movie, Error> {

		let context = container.viewContext
		let movie = Movie(entity: Movie.entity(),
						insertInto: DBManager.shared.container.viewContext)
		movie.title = title
		movie.id = id
		movie.poster = poster
		movie.isFavorite = isFavorite

		do {
			try context.save()
			return .success(movie)
		} catch {
			return .failure(error)
		}
	}
	
	func getMovies(shouldFetchOnlyFavs: Bool = false) -> Result<[Movie], Error> {
		let fetchRequest = Movie.fetchRequest()
		let descriptor: NSSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
		fetchRequest.sortDescriptors = [descriptor]
		let predicate = NSPredicate(format: "isFavorite == true")

		if shouldFetchOnlyFavs { fetchRequest.predicate = predicate }
		let context = container.viewContext

		do {
			let movies = try context.fetch(fetchRequest)
			return .success(movies)
		} catch {
			return .failure(error)
		}
	}
	
	@discardableResult
	func deleteMovie(by id: NSManagedObjectID) -> Result<Void, Error> {
		let context = container.viewContext
		do {
			let movie = try context.existingObject(with: id) as! Movie
			context.delete(movie)
			try context.save()
			return .success(())
		} catch {
			return .failure(error)
		}
	}
	
//	func isExisting(with id: Int) -> Bool {
//		let context = container.viewContext
//		do {
//			let movie = try context.existingObject(with: id) as! Movie
//			return true
//		} catch {
//			return false
//		}
//	}
}
