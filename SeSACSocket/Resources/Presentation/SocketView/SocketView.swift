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
            Text("SOCKET VIEW")
        }
        .padding()
    }
}

#Preview {
    SocketView()
}
