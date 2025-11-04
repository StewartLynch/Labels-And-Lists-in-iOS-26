//
//----------------------------------------------
// Original project: LabelsAndLists
// by  Stewart Lynch on 2025-09-05
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

struct ListsUpdatesView: View {
    @Environment(NavManager.self) var navManager
    @State private var service = GroceryService()
    @State private var searchField = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(service.itemsFilteredBy(searchField)) { item in
                    Label(item.name, systemImage: item.category.systemImage)
                        .font(.title)
                        .labelIconToTitleSpacing(30)
                        .listItemTint(item.category.color)
                }
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle(navManager.selectedTab.rawValue)
            .toolbarTitleDisplayMode(.inlineLarge)
            .searchable(text: $searchField, placement: .navigationBarDrawer(displayMode: .always),prompt: "Filter by name")
        }
    }
}

#Preview {
    ListsUpdatesView()
        .environment(NavManager())
}
