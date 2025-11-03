//
//----------------------------------------------
// Original project: LabelsAndLists
// by  Stewart Lynch on 2025-08-31
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

enum MyTabs: String, CaseIterable, View {
    case labels = "Labels"
    case lists = "Lists"
    case groupings = "Groupings"
    case indexed = "Indexed"
    
    var id: Self { self }
    var body: some View {
        switch self {
        case .labels:
            LabelsInVStack()
        case .lists:
            ListsUpdatesView()
        case .groupings:
            ListGroupings()
        case .indexed:
            IndexedSections()
        }
    }
}

struct StartTab: View {
    @Environment(NavManager.self) var navManager
    
    var body: some View {
        @Bindable var navManager = navManager
        TabView(selection: $navManager.selectedTab) {
            ForEach(MyTabs.allCases.indices, id: \.self) { index in
                let tab = MyTabs.allCases[index]
                Tab(
                    tab.rawValue,
                    systemImage: "\(index + 1).circle",
                    value: tab) {
                        tab
                    }
            }
        }
    }
}

#Preview {
    StartTab()
        .environment(NavManager())
}


