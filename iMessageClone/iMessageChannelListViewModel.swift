//
//  iMessageChannelListViewModel.swift
//  iMessageClone
//
//  Created by Stefan Blos on 03.02.22.
//

import Foundation
import StreamChat
import StreamChatSwiftUI
import OrderedCollections

class iMessageChannelListViewModel: ChatChannelListViewModel {
    
    @Injected(\.chatClient) var chatClient
    
    @Published var pinnedChannels: OrderedSet<ChatChannel> = []
    
    var nonPinnedChannels: LazyCachedMapCollection<ChatChannel> {
        self.channels
            .filter({ channel in
                !self.pinnedChannels.contains(channel)
            })
            .lazyCachedMap { $0 }
    }
    
    func pinChannelTapped(_ channel: ChatChannel) {
        if pinnedChannels.contains(channel) {
            pinnedChannels.remove(channel)
        } else {
            pinnedChannels.append(channel)
        }
    }
    
    func muteTapped(_ channel: ChatChannel) {
        let controller = chatClient.channelController(for: channel.cid)
        
        if channel.isMuted {
            controller.unmuteChannel { error in
                if let error = error {
                    print("Error occurred: \(error.localizedDescription)")
                } else {
                    print("Successfully unmuted channel")
                }
            }
        } else {
            controller.muteChannel { error in
                if let error = error {
                    print("Error occurred: \(error.localizedDescription)")
                } else {
                    print("Successfully muted channel")
                }
            }
        }
    }
}
