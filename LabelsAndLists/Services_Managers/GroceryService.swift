//
//----------------------------------------------
// Original project: LabelsAndLists
// by  Stewart Lynch on 2025-11-03
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import Foundation
import Playgrounds

#Playground {
    let _ = GroceryService().groupedFilteredBy("m")
}

@Observable
class GroceryService {
    var groceryItems: [GroceryItem]
    
    init() {
        groceryItems = GroceryItem.mockData
    }
    
    func itemsFilteredBy(_ filterString: String) -> [GroceryItem] {
        let strippedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !filterString.isEmpty else {
            return groceryItems
                .sorted(using: KeyPathComparator(\GroceryItem.name))
        }
        return groceryItems
            .filter {$0.name.localizedCaseInsensitiveContains(strippedFilter)}
            .sorted(using: KeyPathComparator(\GroceryItem.name))
    }
    
    func groupedFilteredBy(_ filterString: String) -> [GroceryItem.Category : [GroceryItem]] {
        let filteredItems = itemsFilteredBy(filterString)
        return Dictionary(grouping: filteredItems, by: \.category)
    }
    
    var itemsGroupedByAlphabet: [String : [GroceryItem]] {
        let filteredItems = itemsFilteredBy("")
        let dict = Dictionary(grouping: filteredItems, by:  { item in
            item.name.prefix(1).uppercased()
        })
        let allLetters = (65...90).map { String(UnicodeScalar($0)!)}
        var result = [String: [GroceryItem]]()
        for letter in allLetters {
            result[letter] = dict[letter, default: []]
        }
        return result
    }
}
