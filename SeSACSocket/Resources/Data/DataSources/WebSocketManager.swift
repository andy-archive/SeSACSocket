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
    private override init() {
        super.init()
    }
    
    //MARK: - Properties
    private var webSocket: URLSessionWebSocketTask?
    private var timer: Timer? // 5초마다 ping을 위해 생성
    private var isSocketOpen = false // 소켓의 연결 상태
    
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
            ping()
        }
    }
    
    /// 2) close
    func closeWebSocket() {
        webSocket?.cancel(with: .goingAway, reason: nil)
        webSocket = nil
        
        timer?.invalidate()
        timer = nil
        isSocketOpen = false
    }
    
    /// 3) send
    func send() {
        let stringJSON = """
        [{"ticket":"test"},{"type":"orderbook","codes":["KRW-BTC"]}]
        """
        let message = URLSessionWebSocketTask.Message.string(stringJSON)
        
        webSocket?.send(message, completionHandler: { error in
            if let error {
                print("SEND ERROR: \(error.localizedDescription)")
            }
            print(#function, message)
        })
    }
    
    /// 4) receive
    func receive() {
        if isSocketOpen {
            webSocket?.receive(completionHandler: { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let message):
                    print("RECEIVE SUCCESS: \(message)")
                case .failure(let failure):
                    print("RECEIVE FAILURE: \(failure)")
                }
                
                self.receive() // 📝 재귀에 의해 소켓이 내부적으로 유지 됨 (공식 문서)
            })
        }
    }
    
    /// 5) ping
    /// 서버에 의해 연결이 끊어지지 않도록 클라이언트가 주기적으로 보내는 메시지
    private func ping() {
        self.timer = Timer.scheduledTimer(
            withTimeInterval: 5.0,
            repeats: true,
            block: { [weak self] _ in
                self?.webSocket?.sendPing(pongReceiveHandler: { error in
                    if let error {
                        print("PING ERROR")
                    } else {
                        print("PING !!")
                    }
                })
            }
        )
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
    
    /// didOpen - 웹 소켓이 연결되었는지 확인
    func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didOpenWithProtocol protocol: String?
    ) {
        print("OPEN WEBSOCKET")
        isSocketOpen = true
        receive()
    }
    
    /// didClose - 웹 소켓이 연결이 해제 되었는지 확인
    func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
        reason: Data?
    ) {
        isSocketOpen = false
        print("CLOSE WEBSOCKET")
    }
}
