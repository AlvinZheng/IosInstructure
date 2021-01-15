//
//  ContentView.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import SwiftUI
import Combine



struct ContentView: View {
    @ObservedObject var store: UserStore
    var body: some View {
        NavigationView {
            List(store.users){user in
                VStack(alignment: .leading
                       , spacing: 4.0, content: {
                        Text(user.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(user.email).font(.headline)
                })
            }.navigationBarTitle(Text("User"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: UserStore.shared)
    }
}
