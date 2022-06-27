//
//  iMessageLinkView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 24.06.22.
//

import SwiftUI
import Nuke
import NukeUI
import StreamChat
import StreamChatSwiftUI

struct iMessageLinkView: View {
    @Injected(\.colors) private var colors
    @Injected(\.fonts) private var fonts
    
    private let padding: CGFloat = 8
    
    var linkAttachment: ChatMessageLinkAttachment
    var width: CGFloat
    var isFirst: Bool
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !imageHidden {
                ZStack {
                    LazyImage(source: linkAttachment.previewURL ?? linkAttachment.originalURL)
                        .onDisappear(.cancel)
                        .processors([ImageProcessors.Resize(width: width)])
                        .priority(.high)
                        .frame(width: width - 2 * padding, height: (width - 2 * padding) / 2)
                }
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
            print(linkAttachment.payload.originalURL)
            if UIApplication.shared.canOpenURL(linkAttachment.originalURL) {
                UIApplication.shared.open(linkAttachment.originalURL, options: [:])
            }
        }
    }
    
    private var imageHidden: Bool {
        linkAttachment.previewURL == nil
    }
    
    private var authorHidden: Bool {
        linkAttachment.author == nil
    }
}
