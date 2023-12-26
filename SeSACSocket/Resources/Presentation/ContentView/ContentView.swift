//
//  ContentView.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var showNextPage = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("move") {
                showNextPage = true
            }
        }
        .padding()
        .sheet(isPresented: $showNextPage, content: {
            SocketView()
        })
    }
}

#Preview {
    ContentView()
}
