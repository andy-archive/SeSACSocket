//
//  WebSocketManager.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/26/23.
//

import Foundation

final class WebSocketManager: NSObject {
    
    //MARK: - Singleton
    static let shared = WebSocketManager()
    
    /* ⭐️ NSObject의 public init에 의해 override init으로 바뀜 */
    private override init() { }
    
    //MARK: - Properties
    private var webSocket: URLSessionWebSocketTask?
    
    //MARK: - Methods
    /// 1) open
    func openWebSocket() {
        let session = URLSession(
            configuration: .default,
            delegate: self, // URLSessionDelegate 채택해야 함
            delegateQueue: nil
        )
        
        if let url = URL(string: Constants.url.upbit.orderbook) {
            // dataTask가 아닌 webSocketTask
            webSocket = session.webSocketTask(with: url)
            webSocket?.resume()
        }
    }
    
    /// 2) close
    func closeWebSocket() {
        webSocket?.cancel(with: .goingAway, reason: nil)
    }
}

/* 📝 Note
 /* 응답을 받을 때 제약이 있음 -> 클로저 */
 URLSession.shared.dataTask(with: <#T##URLRequest#>).resume()
 
 /* configuration의 별도 설정이 필요함 */
 //URLSession(configuration: .default).dataTask(with: <#T##URLRequest#>).resume()
 */

//MARK: - URLSession WebSocket Delegate
extension WebSocketManager: URLSessionWebSocketDelegate {
    
}
