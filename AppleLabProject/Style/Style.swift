//
//  Style.swift
//  AppleLabProject
//
//  Created by Killian Adonaï on 18/01/2022.
//

import UIKit

class Style {
	
	static let shared = Style()
	
	private func tabBarConfiguration() {
		let tabAppearance = UITabBar.appearance()
		tabAppearance.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 0.2)
		tabAppearance.unselectedItemTintColor = UIColor.lightGray
		tabAppearance.shadowImage = UIImage()
		tabAppearance.isOpaque = false
	}

	
	func setupTheme() {
		tabBarConfiguration()
	}
	
}
