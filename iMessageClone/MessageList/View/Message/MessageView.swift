//
//  MessageView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 29.06.22.
//

import SwiftUI

struct MessageView: View {
    
    var message: String
    var isCurrentUser: Bool
    var isFirst: Bool
    
    var body: some View {
        Text(message)
            .foregroundColor(isCurrentUser ? .white : .primary)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(
                isCurrentUser ? .blue : Color(uiColor: .secondarySystemBackground),
                in: RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
            .background(alignment: isCurrentUser ? .bottomTrailing : .bottomLeading) {
                isFirst
                ?
                Image(isCurrentUser ? "outgoingTail" : "incomingTail")
                    .renderingMode(.template)
                    .foregroundStyle(isCurrentUser ? .blue : Color(uiColor: .secondarySystemBackground))
                : nil
            }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "This is a test message", isCurrentUser: false, isFirst: true)
            .previewLayout(.fixed(width: 400, height: 140))
        MessageView(message: "Can we already say how long their space will take? (Not in it anymore)", isCurrentUser: true, isFirst: true)
            .previewLayout(.fixed(width: 400, height: 140))
        MessageView(message: "This is a test message", isCurrentUser: false, isFirst: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 140))
        MessageView(message: "This is a test message", isCurrentUser: true, isFirst: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 140))
    }
}
