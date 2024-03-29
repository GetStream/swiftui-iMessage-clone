//
//  MessageListHeaderViewModel.swift
//  iMessageClone
//
//  Created by Stefan Blos on 29.06.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

class MessageListHeaderViewModel: ObservableObject {
    
    @Injected(\.utils) var utils
    @Injected(\.chatClient) var chatClient
    
    @Published var headerImage: UIImage?
    @Published var channelName: String?
    
    init(channel: ChatChannel) {
        headerImage = ChannelHeaderLoader().image(for: channel)
        channelName = utils.channelNamer(channel, chatClient.currentUserId ?? "")
    }
    
}
