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
		container = NSPersistentContainer(name: "SongsLive")
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
