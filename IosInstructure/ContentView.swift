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
            List(store.results){result in
                VStack(alignment: .leading
                       , spacing: 4.0, content: {
                        Text(result.userUrl).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(result.issuesUrl).font(.headline)
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
