//
//  iMessageMessageListHeader.swift
//  iMessageClone
//
//  Created by Stefan Blos on 15.06.22.
//

import SwiftUI
import StreamChat

struct iMessageMessageListHeader: ToolbarContent {
    
    @ObservedObject var viewModel: iMessageMessageListHeaderViewModel
    @Binding var isInfoSheetShown: Bool
    @Binding var isVideoSheetShown: Bool
    
    private let headerSize: CGFloat = 20
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Button {
                isInfoSheetShown = true
            } label: {
                VStack(spacing: 4) {
                    if let headerImage = viewModel.headerImage {
                        Image(uiImage: headerImage)
                            .resizable()
                            .frame(width: headerSize, height: headerSize)
                    } else {
                        Circle()
                            .fill(.cyan)
                            .frame(width: headerSize, height: headerSize)
                    }

                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(viewModel.channelName ?? "Unknown")
                            .font(.caption)
                            .foregroundColor(.primary)

                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.bottom, 6)
            }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                isVideoSheetShown = true
            } label: {
                Image(systemName: "video")
            }
        }
    }
}
