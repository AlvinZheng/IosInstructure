//
//  HistoryView.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/18.
//

import SwiftUI
import Combine

struct HistoryView: View {
    @ObservedObject var store: HistoryStore
    var body: some View {
        NavigationView {
            List(store.histories){result in
                VStack(alignment: .leading
                       , spacing: 4.0, content: {
                        Text(formatedTimeString(of: result.timeStamp)).font(.title)
                        Text(result.url).font(.headline)
                })
            }.navigationBarTitle(Text("User"))
        }
    }
}

func formatedTimeString(of time: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: time)
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateformatter.string(from: date)
}
