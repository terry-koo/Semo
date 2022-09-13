//
//  SingingListModalView.swift
//  Semo
//
//  Created by 유정인 on 2022/08/09.
//

import SwiftUI

struct SingingListModalView: View {
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @State var singingListTitle: String = ""
    @State var singingListToggle: [UUID: Bool] = [:]
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            VStack(alignment: .leading) {
                Group {
                    Text("싱잉리스트 만들기")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 28)
                    Text("리스트 이름")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.grayScale2)
                }
                .padding(.horizontal, 24)
                TextFieldView(text: $singingListTitle, placeholder: "새로운 리스트를 추가하세요.")
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 55, trailing: 15))
                Button {
                    // 새로운 SingingList coreData에 추가
                    CoreDataManager.shared.saveNewSingingList( singingListTitle: singingListTitle)
                    singingListTitle = ""
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    FinalConfirmButtonView(buttonName: "리스트 추가하기")
                }
                Spacer()
            }
            .padding(.top, 36)
        }
    }
}

struct SingingListModalView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListModalView()
    }
}
