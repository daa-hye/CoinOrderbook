//
//  ContentView.swift
//  CoinOrderbook
//
//  Created by 박다혜 on 11/20/23.
//

import SwiftUI

struct ContentView: View {

    @State private var banner = 0

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView()
                    LazyVStack {
                        ForEach(dummy) { data in
                            listView(data)
                        }
                    }
                }
            }
            .refreshable { // iOS15+
                banner = 0
                dummy.shuffle()
            }
            .navigationTitle("My Wallet")
        }
    }

    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .frame(maxWidth: .infinity)
            .frame(height: 200)
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 코인")
                    .foregroundStyle(.white)
                Text("\(banner)")
                    .foregroundStyle(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }

    func listView(_ data: Money) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(data.product)")
                    .bold()
                Text("\(data.category.rawValue)")
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("\(data.amountFormat)")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}
