//
//  PinnedChannelsView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 03.02.22.
//

import SwiftUI
import StreamChatSwiftUI

struct PinnedChannelsView: View {
    
    @ObservedObject var viewModel: iMessageChannelListViewModel
    @ObservedObject var channelHeaderLoader: ChannelHeaderLoader
    var factory: iMessageViewFactory
    
    let columnStructure = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columnStructure) {
            ForEach(viewModel.pinnedChannels) { channel in
                ZStack {
                    Button {
                        viewModel.selectedChannel = channel.channelSelectionInfo
                    } label: {
                        VStack {
                            Image(uiImage: channelHeaderLoader.image(for: channel))
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .shadow(radius: 6)
                                .frame(width: 80, height: 80)
                            
                            Text(viewModel.name(forChannel: channel))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    NavigationLink(tag: channel.channelSelectionInfo, selection: $viewModel.selectedChannel) {
                        factory.makeChannelDestination()(channel.channelSelectionInfo)
                    } label: {
                        EmptyView()
                    }
                }
            }
        }
    }
}
