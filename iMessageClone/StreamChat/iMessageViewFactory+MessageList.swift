//
//  iMessageViewFactory+MessageList.swift
//  iMessageClone
//
//  Created by Stefan Blos on 29.06.22.
//

import StreamChat
import StreamChatSwiftUI

extension iMessageViewFactory {
    
    func makeChannelHeaderViewModifier(for channel: ChatChannel) -> MessageListHeaderModifier {
        MessageListHeaderModifier(channel: channel)
    }
    
}
