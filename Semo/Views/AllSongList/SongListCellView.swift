//
//  SongListCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/16.
//

import SwiftUI

struct SongListCellView: View {
    @Binding var songEditButtonTap: Bool
    
    var song: Song
    
    // MARK: - BODY
    var body: some View {
        Button {
        } label: {
            HStack {
                if songEditButtonTap == true {
                    DeleteSongButtonView(songEditButtonTap: $songEditButtonTap, song: song)
                        .padding(.trailing, 8)
                        .transition(.move(edge: .leading))
                        .animation(.easeInOut)
                }
                NavigationLink(destination: SongDetailView(song: song, genderIndex: song.gender!, levelPickerIndex: ["하", "중", "상"].firstIndex(of: song.level ?? "중") ?? 1, tunePickerIndex: ["-6", "-5", "-4", "-3", "-2", "-1", "0", "1", "2", "3", "4", "5", "6"].firstIndex(of: song.tune ?? "0") ?? 0)) {
                    // MARK: - 노래 정보 표시
                    VStack(alignment: .leading, spacing: 10) {
                        Text(song.title ?? "제목 없음")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.grayScale1)
                        Text(song.singer ?? "가수 없음")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale2)
                    }
                    .transition(.slide)
                    .animation(.easeInOut)
                    Spacer()
                    // MARK: - Tune 정보 표시
                    Capsule()
                        .frame(width: 62, height: 32)
                        .foregroundColor(.grayScale7)
                        .overlay(
                            // TODO: Song에 수정 필요
                            Text("\(Text(song.gender ?? "X").foregroundColor(.womanColor)) +3")
                                .foregroundColor(.grayScale1)
                        )
                }
                .disabled(songEditButtonTap)
            }
            .padding(.horizontal, 20)
        }
    }
}
