//
//  iMessageLeadingComposerView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 13.06.22.
//

import SwiftUI
import StreamChatSwiftUI

struct iMessageLeadingComposerView: View {
    
    @Binding var pickerTypeState: PickerTypeState
    
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
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 8)
                .frame(maxHeight: 32)
            case .media:
                closeButton()
            case .instantCommands:
                closeButton()
            case .custom:
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

struct iMessageLeadingComposerView_Previews: PreviewProvider {
    static var previews: some View {
        iMessageLeadingComposerView(pickerTypeState: .constant(.collapsed))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        
        iMessageLeadingComposerView(pickerTypeState: .constant(.expanded(.custom)))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        
        HStack(alignment: .bottom) {
            iMessageLeadingComposerView(pickerTypeState: .constant(.expanded(.none)))
            
            Capsule()
                .stroke(.gray, lineWidth: 2)
                .frame(maxHeight: 50)
            
        }
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        
        iMessageLeadingComposerView(pickerTypeState: .constant(.expanded(.custom)))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
