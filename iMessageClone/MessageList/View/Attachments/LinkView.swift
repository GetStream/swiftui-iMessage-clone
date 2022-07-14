//
//  LinkView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 29.06.22.
//

import SwiftUI
import Nuke
import NukeUI
import StreamChat
import StreamChatSwiftUI

struct LinkView: View {
    
    @Injected(\.colors) var colors
    @Injected(\.fonts) var fonts
    
    var linkAttachment: ChatMessageLinkAttachment
    var width: CGFloat
    
    let padding: CGFloat = 8
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let preview = linkAttachment.previewURL {
                LazyImage(source: preview)
                    .onDisappear(.cancel)
                    .processors([ImageProcessors.Resize(width: width)])
                    .priority(.high)
                    .frame(width: width - 2 * padding, height: (width - 2 * padding) / 2)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if let title = linkAttachment.title {
                    Text(title)
                        .font(fonts.subheadlineBold)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if let baseUrl = linkAttachment.originalURL {
                    Text("\(baseUrl)")
                        .font(fonts.footnote)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
             }
            .padding(.vertical, 12)
            .padding(.horizontal, padding)
            .frame(maxWidth: width - 2 * padding)
        }
        .background(Color(uiColor: colors.background1))
        .clipShape(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .onTapGesture {
            if UIApplication.shared.canOpenURL(linkAttachment.originalURL) {
                            UIApplication.shared.open(linkAttachment.originalURL, options: [:])
                        }
        }
    }
}
