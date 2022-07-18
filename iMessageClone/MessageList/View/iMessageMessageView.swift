//
//  iMessageMessageView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 13.06.22.
//

import SwiftUI

struct iMessageMessageView: View {
    
    var message: String
    var isCurrentUser: Bool
    var isFirst: Bool
    
    var grayBackgroundColor = Color(uiColor: .secondarySystemBackground)
    
    var body: some View {
        Text(message)
            .foregroundColor(isCurrentUser ? .white : .primary)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(
                isCurrentUser ? .blue : grayBackgroundColor,
                in: RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
            .background(
                alignment: isCurrentUser ? .bottomTrailing : .bottomLeading) {
                    isFirst
                    ?
                    Image(isCurrentUser ? "outgoingTail" : "incomingTail")
                        .renderingMode(.template)
                        .foregroundStyle(isCurrentUser ? .blue : grayBackgroundColor)
                    : nil
                }
    }
}

struct iMessageMessageView_Previews: PreviewProvider {
    static var previews: some View {
        iMessageMessageView(message: "This is a test message", isCurrentUser: false, isFirst: true)
            .previewLayout(.fixed(width: 400, height: 140))
        iMessageMessageView(message: "Can we already say how long their space will take? (Not in it anymore)", isCurrentUser: true, isFirst: true)
            .previewLayout(.fixed(width: 400, height: 140))
        iMessageMessageView(message: "This is a test message", isCurrentUser: false, isFirst: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 140))
        iMessageMessageView(message: "This is a test message", isCurrentUser: true, isFirst: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 140))
    }
}
