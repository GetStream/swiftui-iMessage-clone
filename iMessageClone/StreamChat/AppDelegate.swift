//
//  AppDelegate.swift
//  iMessageClone
//
//  Created by Stefan Blos on 28.01.22.
//

import Foundation
import SwiftUI
import StreamChat
import StreamChatSwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    @Injected(\.utils) var utils
    
    var streamChat: StreamChat?
    
    var chatClient: ChatClient = {
        var config = ChatClientConfig(apiKey: .init("8br4watad788"))
        config.applicationGroupIdentifier = "group.io.getstream.iOS.ChatDemoAppSwiftUI"
        
        let client = ChatClient(config: config)
        return client
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        streamChat = StreamChat(chatClient: chatClient)
        
        connectUser()
        
        return true
    }
    
    private func connectUser() {
        let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.kFSLHRB5X62t0Zlc7nwczWUfsQMwfkpylC6jCUZ6Mc0")
            
        chatClient.connectUser(
                userInfo: .init(id: "luke_skywalker",
                                name: "Luke Skywalker",
                                imageURL: URL(string: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg")!),
                token: token
        ) { error in
            if let error = error {
                log.error("connecting the user failed \(error)")
                return
            }
        }
    }
    
}
