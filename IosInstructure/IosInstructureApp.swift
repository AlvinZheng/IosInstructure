//
//  IosInstructureApp.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import SwiftUI

@main
struct IosInstructureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: UserStore.shared)
                .onAppear() {
                    UserStore.shared.startFetch(interval: 5.0)
                }.onDisappear(){
                    UserStore.shared.stopFetch()
                }
        }
    }
}
