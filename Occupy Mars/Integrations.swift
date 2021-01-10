import Foundation
import CoreSpotlight
import MobileCoreServices
import UIKit

class Integrations {
	
	static func setupSearchableContent() {
		var searchableItems = [CSSearchableItem]()
		
		for group in Objects.solarSystem() {
			var i = 0
			for planet in group.value {
				let searchableItemAttributeSet = generateSearchableItemFor(object: planet, classification: planet.classification.rawValue, relatedTo: planet.type.rawValue)
				let searchableItem = CSSearchableItem(uniqueIdentifier: "orbitals.group-\(group.key.rawValue).planet-\(i)", domainIdentifier: "planet", attributeSet: searchableItemAttributeSet)
				searchableItems.append(searchableItem)
				
				var j = 0
				for moon in planet.moons {
					let searchableItemAttributeSet = generateSearchableItemFor(object: moon, classification: "Moon", relatedTo: planet.name)
					let searchableItem = CSSearchableItem(uniqueIdentifier: "orbitals.group-\(group.key.rawValue).planet-\(i).moon-\(j)", domainIdentifier: "moon", attributeSet: searchableItemAttributeSet)
					searchableItems.append(searchableItem)
					j += 1
				}
				i += 1
			}
		}
		
		CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
			if error != nil {
				print(error?.localizedDescription ?? "error indexing")
			}
		}
	}
	
	static func generateSearchableItemFor(object: Body, classification: String, relatedTo: String) -> CSSearchableItemAttributeSet {
		let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
		
		if let let_image = object.thumbnail {
			searchableItemAttributeSet.thumbnailData = UIImage(named: let_image)!.pngData()
		}
		searchableItemAttributeSet.title = object.name
		searchableItemAttributeSet.displayName = object.name
		searchableItemAttributeSet.kind = classification
		searchableItemAttributeSet.keywords = [object.name, classification, relatedTo]
		
		if let let_description = object.description {
			searchableItemAttributeSet.contentDescription = let_description
		}
		
		return searchableItemAttributeSet
	}
}
