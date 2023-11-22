//
//  ListView.swift
//  CoinOrderbook
//
//  Created by 박다혜 on 11/22/23.
//

import SwiftUI

struct ListView: View {

    @StateObject var viewModel = ListViewModel()

    var body: some View {
        LazyVStack {
            ForEach(viewModel.market, id: \.self) { data in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(data.koreanName)")
                            .bold()
                        Text("\(data.englishName)")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Text("\(data.market)")
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}

#Preview {
    ListView()
}
