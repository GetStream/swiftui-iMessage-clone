//
//  iMessageViewFactory+MessageList.swift
//  iMessageClone
//
//  Created by Stefan Blos on 13.06.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

extension iMessageViewFactory {
    
    func makeMessageTextView(
        for message: ChatMessage,
        isFirst: Bool,
        availableWidth: CGFloat,
        scrolledId: Binding<String?>
    ) -> some View {
        guard let userId = chatClient.currentUserId else {
            return iMessageMessageView(message: message.text, isCurrentUser: false, isFirst: isFirst)
        }
        return iMessageMessageView(message: message.text, isCurrentUser: userId == message.author.id, isFirst: isFirst)
    }
    
    func makeMessageDateView(for message: ChatMessage) -> some View {
        EmptyView()
    }
    
    func makeMessageReadIndicatorView(channel: ChatChannel, message: ChatMessage) -> some View {
        EmptyView()
    }
    
    func makeLeadingComposerView(
        state: Binding<PickerTypeState>,
        channelConfig: ChannelConfig?
    ) -> some View {
        iMessageLeadingComposerView(pickerTypeState: state)
    }
    
    func makeTrailingComposerView(
        enabled: Bool,
        cooldownDuration: Int,
        onTap: @escaping () -> Void
    ) -> some View {
        EmptyView()
    }
    
    func makeComposerInputView(
        text: Binding<String>,
        selectedRangeLocation: Binding<Int>,
        command: Binding<ComposerCommand?>,
        addedAssets: [AddedAsset],
        addedFileURLs: [URL],
        addedCustomAttachments: [CustomAttachment],
        quotedMessage: Binding<ChatMessage?>,
        maxMessageLength: Int?,
        cooldownDuration: Int,
        onCustomAttachmentTap: @escaping (CustomAttachment) -> Void,
        shouldScroll: Bool,
        removeAttachmentWithId: @escaping (String) -> Void
    ) -> some View {
        iMessageComposerInputView(input: text) { [unowned self] message in
            guard let channelId = channelId else {
                // We should catch errors here
                return
            }
            
            chatClient
                .channelController(for: channelId)
                .createNewMessage(text: message)
        }
    }
    
    func makeChannelHeaderViewModifier(for channel: ChatChannel) -> iMessageMessageListHeaderModifier {
        iMessageMessageListHeaderModifier(channel: channel)
    }
}
