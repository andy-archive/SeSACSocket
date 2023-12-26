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
        /// 1) open socket
        WebSocketManager.shared.openWebSocket()
        
        /// 2) send data
        WebSocketManager.shared.send()
    }
    
    //MARK: - De-intializer
    deinit {
        WebSocketManager.shared.closeWebSocket()
    }
}
