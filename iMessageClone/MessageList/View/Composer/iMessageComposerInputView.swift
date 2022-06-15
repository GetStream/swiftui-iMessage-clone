//
//  iMessageComposerInputView.swift
//  iMessageClone
//
//  Created by Stefan Blos on 14.06.22.
//

import SwiftUI

struct iMessageComposerInputView: View {
    
    @Binding var input: String
    var send: (String) -> Void
    
    @State private var showNotImplementedAlert = false
    @State private var effectsViewShown = false
    
    private var hasContent: Bool {
        return !input.isEmpty
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            TextField("iMessage", text: $input)
                .multilineTextAlignment(.leading)
                .lineLimit(0)
                .padding(.leading, 12)
            
            if hasContent {
                Button {
                    // Taps are handled in the gestures, see this article:
                    // https://steipete.com/posts/supporting-both-tap-and-longpress-on-button-in-swiftui/
                    
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .font(.body.weight(.semibold))
                }
                .simultaneousGesture(
                    LongPressGesture()
                        .onEnded({ _ in
                            // show message effects
                            effectsViewShown = true
                        })
                )
                .simultaneousGesture(
                    TapGesture()
                        .onEnded {
                            // send message
                            send(input)
                            
                            // Note: we're ignoring the error case here for simplicity
                            input = ""
                        }
                )

            } else {
                Button {
                    showNotImplementedAlert = true
                } label: {
                    Image(systemName: "waveform.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.secondary)
                }
                .alert("This is not yet implemented. But we might do it in the future. Let us know if you're interested in voice messaging.", isPresented: $showNotImplementedAlert) {
                    Button("OK", role: .cancel) {}
                }
                
            }
        }
        .padding(4)
        .overlay(
            Capsule()
                .stroke(.tertiary, lineWidth: 1)
                .opacity(0.7)
        )
        .padding(.trailing, 8)
        .sheet(isPresented: $effectsViewShown) {
            Text("We will show the Effects view here in the future.")
        }
    }
}

struct iMessageComposerInputView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            iMessageComposerInputView(input: .constant("")) { message in
                print("Yes")
            }
                .padding()
                .previewLayout(.fixed(width: 360, height: 100.0))
            
            iMessageComposerInputView(input: .constant("This is my message to you")) { message in
                print("Yes")
            }
                .padding()
                .previewLayout(.fixed(width: 360, height: 100.0))
            
            iMessageComposerInputView(input: .constant("")) { message in
                print("Yes")
            }
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 360, height: 100.0))
            
            iMessageComposerInputView(input: .constant("This is my message to you")) { message in
                print("Yes")
            }
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 360, height: 100.0))
        }
    }
}
