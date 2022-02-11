//
//  iMessageChannelListHeader.swift
//  iMessageClone
//
//  Created by Stefan Blos on 01.02.22.
//

import SwiftUI

struct iMessageChannelListHeader: ToolbarContent {
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                // TBD
            } label: {
                Text("Edit")
            }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                // TBD
            } label: {
                Image(systemName: "square.and.pencil")
            }

        }
    }
}
