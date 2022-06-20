//
//  iMessageMessageListHeaderViewModel.swift
//  iMessageClone
//
//  Created by Stefan Blos on 20.06.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

class iMessageMessageListHeaderViewModel: ObservableObject {
    
    @StateObject private var channelHeaderLoader = ChannelHeaderLoader()
    @Injected(\.utils) var utils
    @Injected(\.chatClient) var chatClient
    
    var headerImage: UIImage?
    var channelName: String?
    
    var channel: ChatChannel
    
    init(channel: ChatChannel) {
        self.channel = channel
        headerImage = channelHeaderLoader.image(for: channel)
        channelName = utils.channelNamer(channel, chatClient.currentUserId ?? "")
    }
    
}
