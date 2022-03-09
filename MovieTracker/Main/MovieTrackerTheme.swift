//
//  MovieTrackerTheme.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import UIKit

class MovieTrackerTheme {
	
	static let shared = MovieTrackerTheme()
	
	private func tabBarConfiguration() {
		let tabAppearance = UITabBar.appearance()
		tabAppearance.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
		tabAppearance.unselectedItemTintColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
		tabAppearance.tintColor = UIColor.white
	}

	
	func setupTheme() {
		tabBarConfiguration()
	}
	
}

