//
//  iMessageViewFactory.swift
//  iMessageClone
//
//  Created by Stefan Blos on 28.01.22.
//

import Foundation
import SwiftUI
import StreamChatSwiftUI
import StreamChat

class iMessageViewFactory: ViewFactory {
    
    @Injected(\.chatClient) var chatClient: ChatClient
    
    var channelId: ChannelId?
    
}
