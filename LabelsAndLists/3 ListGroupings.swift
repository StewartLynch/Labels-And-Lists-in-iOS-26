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

struct ListGroupings: View {
    @Environment(NavManager.self) var navManager
    @State private var service = GroceryService()
    @State private var searchField = ""
    
    var body: some View {
        NavigationStack {
            List {
                let dict = service.groupedFilteredBy(searchField)
                ForEach(dict.keys.sorted {$0.rawValue < $1.rawValue}, id: \.self) { category in
                    if let items = dict[category] {
                        Section {
                            ForEach(items) { item in
                                Text(item.name)
                                    .badge(item.quantity)
                            }
                        } header: {
//                            Label(category.rawValue, systemImage: category.systemImage)
                            LabeledContent {
                                Text(category.rawValue)
                                    .foregroundStyle(Color(.label))
                            } label: {
                                Image(systemName: category.systemImage)
                                    .foregroundStyle(category.color)
                            }
                            .font(.title3.bold())
                            .fixedSize(horizontal: true, vertical: false)
                        }

                    }
                }
            }
            .background(.orange.opacity(0.4))
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbarBackground(.orange, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .scrollEdgeEffectStyle(.soft, for: .all)
            .listRowSpacing(5)
            .searchable(text: $searchField, prompt: "Filter on product name")
            .navigationTitle(navManager.selectedTab.rawValue)
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(role: .close) {
                        
                    }
                    Button(role: .destructive) {
                        
                    }
                }
                .sharedBackgroundVisibility(.hidden)
            }
        }
    }
}

#Preview {
    ListGroupings()
        .environment(NavManager())
}
