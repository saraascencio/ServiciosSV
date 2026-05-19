//
//  ServiciosSVApp.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//

import SwiftUI

@main
struct ServiciosSVApp: App {
    let diContainer = AppDIContainer()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: diContainer.makeHomeViewModel())
                .preferredColorScheme(.light)
        }
    }
}
