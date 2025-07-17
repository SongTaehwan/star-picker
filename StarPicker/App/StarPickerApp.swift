//
//  StarPickerApp.swift
//  StarPicker
//
//  Created by 송태환 on 7/17/25.
//

import SwiftUI

@main
struct StarPickerApp: App {
    @StateObject private var coordinator: AppCoordinator
    
    init() {
        let container = AppContainer()
        self._coordinator = .init(wrappedValue: container.makeAppCoordinator())
    }
    
    var body: some Scene {
        WindowGroup {
            AppEntryView(coordinator: coordinator)
        }
    }
}
