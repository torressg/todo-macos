# Tasks for macOS

A native macOS task manager built from scratch with SwiftUI. Tasks are grouped into subjects in a master-detail layout, designed to be driven from the keyboard.

## Features

- Create, rename and delete subjects (categories) and their tasks
- Mark tasks as done and hide completed ones with a filter
- Delete one item or many at once
- Everything is saved locally and restored on launch

## Stack

- **Swift** and **SwiftUI**, with `NavigationSplitView` for the native master-detail layout
- **Combine** (`ObservableObject` / `@Published`) for state
- **Codable** + **UserDefaults** for persistence, saved automatically on every change
- **MVVM** architecture

## Project structure

```
todo-macos/
├── App/          # Entry point
├── Models/       # Todo and Subject
├── ViewModels/   # TodoViewModel: state and business logic
├── Views/        # Subject list and subject detail
└── Helpers/      # Window access utility
```

## Running

Requires macOS 13+ and Xcode 14+.

1. Clone the repo
2. Open the project in Xcode
3. Run the `todo-macos` scheme

More about it at [ogtorres.dev/projects/todo-macos](https://ogtorres.dev/projects/todo-macos).
