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
	
//	func addWatchLater(
//		name: String,
//		muscle1: String,
//		muscle2: String,
//		exerciceId: NSManagedObjectID? = nil
//	) -> Result<Exercice, Error> {
//
//		let context = container.viewContext
//		let exercice = Exercice(entity: Exercice.entity(),
//						insertInto: DBManager.shared.container.viewContext)
//		exercice.name = name
//		exercice.muscle1 = muscle1
//		exercice.muscle2 = muscle2
//
//		do {
//			try context.save()
//			return .success(exercice)
//		} catch {
//			return .failure(error)
//		}
//	}
	
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
	
//	func addSeen(
//		name: String,
//		muscle1: String,
//		muscle2: String,
//		exerciceId: NSManagedObjectID? = nil
//	) -> Result<Exercice, Error> {
//
//		let context = container.viewContext
//		let exercice = Exercice(entity: Exercice.entity(),
//						insertInto: DBManager.shared.container.viewContext)
//		exercice.name = name
//		exercice.muscle1 = muscle1
//		exercice.muscle2 = muscle2
//
//		do {
//			try context.save()
//			return .success(exercice)
//		} catch {
//			return .failure(error)
//		}
//	}
}
