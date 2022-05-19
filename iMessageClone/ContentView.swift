//
//  ContentView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 28.01.22.
//

import SwiftUI
import StreamChatSwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: iMessageChannelListViewModel = iMessageChannelListViewModel()
    @StateObject private var channelHeaderLoader = ChannelHeaderLoader()
    var factory: iMessageViewFactory
    
    @State private var tabBar: UITabBar?
    
    @State private var channelsInitialized = false
    
    var body: some View {
        ScrollView {
            if viewModel.pinnedChannels.count > 0 {
                PinnedChannelsView(viewModel: viewModel, channelHeaderLoader: channelHeaderLoader, factory: factory)
            }
            
            ChannelList(
                factory: factory,
                channels: viewModel.nonPinnedChannels,
                selectedChannel: $viewModel.selectedChannel,
                swipedChannelId: $viewModel.swipedChannelId,
                scrollable: false,
                onlineIndicatorShown: viewModel.onlineIndicatorShown(for:),
                imageLoader: channelHeaderLoader.image(for:),
                onItemTap: { channel in
                    viewModel.selectedChannel = channel.channelSelectionInfo
                },
                onItemAppear: viewModel.checkForChannels(index:),
                channelNaming: viewModel.name(forChannel:),
                channelDestination: factory.makeChannelDestination(),
                trailingSwipeRightButtonTapped: viewModel.onDeleteTapped(channel:),
                trailingSwipeLeftButtonTapped: viewModel.muteTapped(_:),
                leadingSwipeButtonTapped: viewModel.pinChannelTapped(_:)
            )
                .alert(isPresented: $viewModel.alertShown) {
                    switch viewModel.channelAlertType {
                    case let .deleteChannel(channel):
                        return Alert(
                            title: Text("Delete channel"),
                            message: Text("Are you sure you want to delete the channel?"),
                            primaryButton: .destructive(Text("Delete")) {
                                viewModel.delete(channel: channel)
                            },
                            secondaryButton: .cancel()
                        )
                    default:
                        return Alert.defaultErrorAlert
                    }
                }
            
        }
        .background(
            Color.clear.background(
                TabBarAccessor { tabBar in
                    self.tabBar = tabBar
                }
            )
            .allowsHitTesting(false)
        )
        .onReceive(viewModel.$selectedChannel, perform: { channel in
            self.tabBar?.isHidden = channel != nil
        })
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    // TBD
                } label: {
                    Text("Edit")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // TBD
                } label: {
                    Image(systemName: "square.and.pencil")
                }
                
            }
        }
    }
}

struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void
    private let proxyController = ViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) ->
        UIViewController {
        proxyController.callback = callback
        return proxyController
    }

    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: UIViewControllerRepresentableContext<TabBarAccessor>
    ) {
        // No handling needed.
    }

    typealias UIViewControllerType = UIViewController

    private class ViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in
            // Default implementation.
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let tabBar = tabBarController {
                callback(tabBar.tabBar)
            }
        }
    }
}
