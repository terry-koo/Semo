//
//  TestSongListView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct TestSongListView: View {
    var body: some View {
        NavigationView {
            Button {
                    } label: {
                        NavigationLink(destination: SongDetailView()) {
                            Text("Go to SongDetailView")
                        }
                }
                    .navigationTitle("메인")
        }
    }
}

struct TestSongListView_Previews: PreviewProvider {
    static var previews: some View {
        TestSongListView()
    }
}
