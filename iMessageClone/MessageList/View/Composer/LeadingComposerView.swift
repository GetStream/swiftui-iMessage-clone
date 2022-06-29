//
//  LeadingComposerView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 29.06.22.
//

import SwiftUI
import StreamChatSwiftUI

struct LeadingComposerView: View {
    
    @Binding var pickerTypeState:PickerTypeState
    
    var body: some View {
        switch pickerTypeState {
        case .expanded(let attachmentPickerType):
            switch attachmentPickerType {
            case .none:
                HStack(spacing: 16) {
                    Button {
                        withAnimation {
                            pickerTypeState = .expanded(.media)
                        }
                    } label: {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 22)
                            .foregroundColor(.gray)
                    }
                    
                    Button {
                        withAnimation {
                            pickerTypeState = .expanded(.none)
                        }
                    } label: {
                        Image("store")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 8)
                .frame(maxHeight: 32)
            case .media, .instantCommands, .custom:
                closeButton()
            }
        case .collapsed:
            closeButton()
        }
    }
    
    @ViewBuilder func closeButton() -> some View {
        VStack {
            Spacer()
            
            Button {
                withAnimation {
                    pickerTypeState = .expanded(.none)
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 20, height: 20, alignment: .center)
            }
            
            Spacer()
        }
        .frame(maxHeight: 40)
    }
}

struct LeadingComposerView_Previews: PreviewProvider {
    static var previews: some View {
        LeadingComposerView(pickerTypeState: .constant(.expanded(.none)))
            .previewLayout(.fixed(width: 400.0, height: 100.0))
        
        LeadingComposerView(pickerTypeState: .constant(.collapsed))
            .previewLayout(.fixed(width: 400.0, height: 100.0))
        
        HStack(alignment: .bottom) {
            LeadingComposerView(pickerTypeState: .constant(.expanded(.none)))
            
            Capsule()
                .stroke(.gray, lineWidth: 2)
                .frame(maxHeight: 50)
            
        }
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 400.0, height: 100.0))
        
        LeadingComposerView(pickerTypeState: .constant(.expanded(.none)))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400.0, height: 100.0))
    }
}
