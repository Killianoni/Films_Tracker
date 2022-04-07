//
//  NetworkManager.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 23/03/2022.
//

import Foundation
import CoreData

struct NetworkManager {
	static let shared = NetworkManager()

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
}

