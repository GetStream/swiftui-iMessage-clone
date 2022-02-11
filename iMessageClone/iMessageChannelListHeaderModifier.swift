//
//  iMessageChannelListHeaderModifier.swift
//  iMessageClone
//
//  Created by Stefan Blos on 01.02.22.
//

import SwiftUI
import StreamChatSwiftUI

struct iMessageChannelListHeaderModifier: ChannelListHeaderViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content.toolbar {
            iMessageChannelListHeader()
        }
    }
}
