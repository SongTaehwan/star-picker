//
//  AppCoordinator.swift
//  StarPicker
//
//  Created by 송태환 on 7/17/25.
//

import SwiftUI

enum Page: Hashable {
    case list
    case detail(Apod)
    // 이후 deep link 요구에 따라 추가
    // case search(query: String)
}

enum Sheet: Identifiable {
    var id: Self { self }
    case modal
}

enum FullScreenCover: Identifiable {
    var id: Self { self }
    case cover
}

final class AppCoordinator: ObservableObject {
    @Published var path = [Page]()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .list:
            VStack {
                StarListScene()
                Button("button") {
                    self.path.append(.detail(.init(id: "123")))
                }
                Button("modal") {
                    self.sheet = .modal
                }
                Button("fullscreencover") {
                    self.fullScreenCover = .cover
                }
                Button("popToRoot") {
                    self.popToRoot()
                }
            }
            
        case .detail(_):
            StarDetail()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .modal:
            VStack {
                Text("MODAL")
                Button("dismiss") {
                    self.dismissSheet()
                }
                Button("button") {
                    self.path.append(.list)
                }
            }
        @unknown default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .cover:
            Text("COVER")
            Button("dismiss") {
                self.dismissCover()
            }
            Button("button") {
                self.dismissCover()
                self.path.append(.list)
                self.path.append(.detail(.init(id: "321")))
                self.path.append(.list)
            }
        @unknown default:
            VStack {
                EmptyView()
            }
        }
    }
}
