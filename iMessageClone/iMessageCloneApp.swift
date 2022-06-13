//
//  iMessageCloneApp.swift
//  iMessageClone
//
//  Created by Stefan Blos on 28.01.22.
//

import SwiftUI
import StreamChatSwiftUI

@main
struct iMessageCloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            iMessageChannelList(viewFactory: iMessageViewFactory())
        }
    }
}
