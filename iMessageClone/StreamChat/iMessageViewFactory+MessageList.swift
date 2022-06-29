//
//  iMessageViewFactory+MessageList.swift
//  iMessageClone
//
//  Created by Stefan Blos on 29.06.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

extension iMessageViewFactory {
    
    func makeChannelHeaderViewModifier(for channel: ChatChannel) -> MessageListHeaderModifier {
        MessageListHeaderModifier(channel: channel)
    }
    
    func makeMessageTextView(
        for message: ChatMessage,
        isFirst: Bool,
        availableWidth: CGFloat,
        scrolledId: Binding<String?>
    ) -> MessageView {
        guard let userId = chatClient.currentUserId else {
            return MessageView(message: message.text, isCurrentUser: false, isFirst: isFirst)
        }
        
        return MessageView(message: message.text, isCurrentUser: userId == message.author.id, isFirst: isFirst)
    }
    
    func makeMessageDateView(for message: ChatMessage) -> some View {
        EmptyView()
    }
    
    func makeMessageReadIndicatorView(channel: ChatChannel, message: ChatMessage) -> some View {
        EmptyView()
    }
    
}
