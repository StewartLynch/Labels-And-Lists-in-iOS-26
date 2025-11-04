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

struct LabelsInVStack: View {
    @Environment(NavManager.self) var navManager
    @State private var service = GroceryService()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(service.groceryItems) { item in
                    HStack {
//                        Label(item.name, systemImage: item.category.systemImage)
//                            .font(.title)
                        Label {
                            Text(item.name)
                        } icon: {
                            Image(systemName: item.category.systemImage)
                                .foregroundStyle(item.category.color)
                        }
                        .font(.title)
                        Spacer()
                        Text(item.quantity, format: .number)
                    }
                    .labelReservedIconWidth(40)
                }
                Spacer()
            }
            .padding()
            .navigationTitle(navManager.selectedTab.rawValue)
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

#Preview {
    LabelsInVStack()
        .environment(NavManager())
}
