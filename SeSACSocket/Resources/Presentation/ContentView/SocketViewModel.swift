//
//  SocketViewModel.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/26/23.
//

import Foundation

final class SocketViewModel: ObservableObject {
    
    //MARK: - Initializer
    init() {
        WebSocketManager.shared.openWebSocket()
    }
    
    //MARK: - De-intializer
    deinit {
        WebSocketManager.shared.closeWebSocket()
    }
}
