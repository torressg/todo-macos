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
    }
}

#Preview {
    ContentView()
}
