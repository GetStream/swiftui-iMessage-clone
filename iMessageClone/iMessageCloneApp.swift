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
            TestStreamTabs()
        }
    }
}

struct TestStreamTabs: View {
    var body: some View {
        TabView {
            TabOneView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            TabTwoView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct TabOneView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Test Tab One")
            }
        }
    }
}

struct TabTwoView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Test Tab Two")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Spacer()
                        NavigationLink(destination: ContentView(factory: iMessageViewFactory())) {
                            
                            Image(systemName: "envelope")
                                .imageScale(.large)
                        }
                    }
                    
                }
            }
        }
    }
}
