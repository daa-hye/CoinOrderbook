//
//  ContentView.swift
//  CoinOrderbook
//
//  Created by 박다혜 on 11/20/23.
//

import SwiftUI

struct ContentView: View {

    @State private var banner = "73,234,634,944원"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView()
                    LazyVStack {
                        ForEach(1..<50) { data in
                            listView(data)
                        }
                    }
                }
            }
            .refreshable { // iOS15+
                banner = "54,753,235원"
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
                Text(banner)
                    .foregroundStyle(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }

    func listView(_ data: Int) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(data) 코인")
                Text("\(data) coin")
            }
            Spacer()
            Text("KRW-BTC")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}
