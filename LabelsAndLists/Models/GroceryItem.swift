//
//----------------------------------------------
// Original project: LandLDev
// by  Stewart Lynch on 2025-11-02
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



import SwiftUI

struct GroceryItem: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
    let category: Category
    
    enum Category: String {
        case produce = "Produce"
        case bakery = "Bakery"
        case dairy = "Dairy"
        case pantry = "Pantry"
        case beverages = "Beverages"
        
        var systemImage: String {
            switch self {
            case .produce:
                "leaf.fill"
            case .bakery:
                "birthday.cake.fill"
            case .dairy:
                "cart.fill"
            case .pantry:
                "shippingbox.fill"
            case .beverages:
                "waterbottle.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .produce:
                    .green
            case .bakery:
                    .orange
            case .dairy:
                    .blue
            case .pantry:
                    .teal
            case .beverages:
                    .mint
            }
        }
    }
    
    static let mockData: [GroceryItem] = [
        GroceryItem(name: "Bananas", quantity: 6, category: .produce),
        GroceryItem(name: "Croissants", quantity: 4, category: .bakery),
        GroceryItem(name: "Milk", quantity: 2, category: .dairy),
        GroceryItem(name: "Rice", quantity: 2, category: .pantry),
        GroceryItem(name: "Sparkling Water", quantity: 6, category: .beverages),
        GroceryItem(name: "Carrots", quantity: 2, category: .produce),
        GroceryItem(name: "Cheddar Cheese", quantity: 1, category: .dairy),
        GroceryItem(name: "Orange Juice", quantity: 2, category: .beverages),
        GroceryItem(name: "Whole Wheat Bread", quantity: 1, category: .bakery),
        GroceryItem(name: "Pasta", quantity: 3, category: .pantry),
        GroceryItem(name: "Apples", quantity: 4, category: .produce),
        GroceryItem(name: "Coffee", quantity: 1, category: .beverages),
        GroceryItem(name: "Yogurt", quantity: 6, category: .dairy),
        GroceryItem(name: "Canned Tomatoes", quantity: 4, category: .pantry),
        GroceryItem(name: "Spinach", quantity: 1, category: .produce)
    ]
}


