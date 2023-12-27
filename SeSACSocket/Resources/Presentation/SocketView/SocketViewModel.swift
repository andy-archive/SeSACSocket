//
//  SocketViewModel.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/26/23.
//

import Combine
import Foundation

final class SocketViewModel: ObservableObject {
    
    //MARK: - Published Properties
    @Published
    var askOrderBook: [OrderbookItem] = []
    
    @Published
    var bidOrderBook: [OrderbookItem] = []
    
    //MARK: - Private Properties
    private var cancellable = Set<AnyCancellable>() // Disposable in RxSwift
    
    //MARK: - Initializer
    init() {
        /// 1) open socket
        WebSocketManager.shared.openWebSocket()
        
        /// 2) send data
        WebSocketManager.shared.send()
        
        /// 3) Combine
        ///     sink (subscribe in RxSwift)
        ///     receive (schedular in RxSwift)
        ///     AnyCancellable (Disposable in RxSwift)
        WebSocketManager.shared.orderBookSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] order in
                guard let self else { return }
                
                self.askOrderBook = order.orderbookUnits
                    .map { .init(price: $0.askPrice, size: $0.askSize) }
                    .sorted { $0.price > $1.price }
                self.bidOrderBook = order.orderbookUnits
                    .map { .init(price: $0.bidPrice, size: $0.bidSize) }
                    .sorted { $0.price > $1.price }
            }
            .store(in: &cancellable)
    }
    
    //MARK: - Deintializer
    deinit {
        WebSocketManager.shared.closeWebSocket()
        print("DEINIT SocketViewModel")
    }
}
