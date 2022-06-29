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
         ComposerInputView(input: text) { [unowned self] message in
             guard let channelId = channelId else {
                 return
             }
             
             chatClient
                 .channelController(for: channelId)
                 .createNewMessage(text: message)
         }
     }
    
    func makeLeadingComposerView(
        state: Binding<PickerTypeState>,
        channelConfig: ChannelConfig?) -> some View {
        LeadingComposerView(pickerTypeState: state)
    }
    
    func makeTrailingComposerView(
        enabled: Bool,
        cooldownDuration: Int,
        onTap: @escaping () -> Void
    ) -> some View {
        EmptyView()
    }
}
