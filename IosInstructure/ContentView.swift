//
//  ContentView.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import SwiftUI
import Combine



struct ContentView: View {
    @ObservedObject var store: EndPointResultStore
    var body: some View {
        NavigationView {
            List(store.results){result in
                VStack(alignment: .leading
                       , spacing: 4.0, content: {
                        Text("user url" + result.userUrl).font(.headline)
                        Text("issues url" + result.issuesUrl).font(.headline)
                })
            }.navigationBarTitle(Text("github Endpoint test"))
            .navigationBarItems(trailing:
                NavigationLink(
                    destination:
                        HistoryView(store: HistoryStore.shared).onAppear(){
                            HistoryStore.shared.loadHistory()
                        },
                    label: {
                        Text("call history")
                    }
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: EndPointResultStore.shared)
    }
}
