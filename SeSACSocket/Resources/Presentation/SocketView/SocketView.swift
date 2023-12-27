//
//  SocketView.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/26/23.
//

import SwiftUI

struct SocketView: View {
    
    //MARK: - ViewModel
    @StateObject
    private var viewModel = SocketViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.askOrderBook, id: \.id) { item in
                Text("\(item.price)")
            }
        }
        .padding()
    }
}

#Preview {
    SocketView()
}
