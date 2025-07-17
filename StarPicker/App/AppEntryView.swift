//
//  AppEntryView.swift
//  StarPicker
//
//  Created by 송태환 on 7/17/25.
//

import SwiftUI

struct AppEntryView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .list)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: fullScreenCover)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    AppEntryView(coordinator: .init())
}
