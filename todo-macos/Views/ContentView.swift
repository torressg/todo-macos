//
//  ContentView.swift
//  todo-macos
//
//  Created by Guilherme Torres Vanderlei on 17/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "square.and.pencil")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("To-Do App")
        }
        .padding()
                .background(
                    WindowAccessor { window in
                        window.isMovable = true
                        window.styleMask.remove(.resizable)
                        window.setContentSize(NSSize(width: 900, height: 600))
                        window.center()
                        window.standardWindowButton(.zoomButton)?.isHidden = true
                    }
                )
    }
}

#Preview {
    ContentView()
}
