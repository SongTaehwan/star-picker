//
//  AppContainer.swift
//  StarPicker
//
//  Created by 송태환 on 7/17/25.
//

import SwiftUI

final class AppContainer {
    private let config: Config
    
    init() {
        do {
            self.config = try Config()
        } catch {
            fatalError("Config 초기화 실패 \(error)")
        }
    }
    
    func makeAppCoordinator() -> AppCoordinator {
        return AppCoordinator()
    }
}
