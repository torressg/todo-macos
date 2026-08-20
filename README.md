# todo-macos

Aplicativo nativo macOS para gerenciamento de tarefas desenvolvido com SwiftUI, implementando arquitetura MVVM com persistência local.

## Stack Tecnológico

- **SwiftUI** - Interface declarativa nativa
- **Swift** - Linguagem de programação
- **Combine** - Framework para programação reativa
- **UserDefaults** - Persistência local de dados
- **Codable** - Serialização e desserialização JSON

## Arquitetura

O projeto segue o padrão **MVVM** (Model-View-ViewModel), separando responsabilidades em:

- **Models**: `Todo` e `TodoSubject` - Estruturas de dados com conformidade `Codable` e `Identifiable`
- **Views**: `ContentView` e `SubjectDetailView` - Componentes de interface declarativa
- **ViewModels**: `TodoViewModel` - Lógica de negócio e gerenciamento de estado

## Funcionalidades

- CRUD completo para subjects (categorias) e tasks (tarefas)
- Persistência automática em UserDefaults com serialização JSON
- Navegação hierárquica com `NavigationStack` e `NavigationSplitView`
- Filtro para exibir/ocultar tarefas concluídas
- Interface master-detail nativa do macOS
- Toggle de status de conclusão das tarefas
- Remoção de subjects e tasks individuais ou em lote

## Estrutura do Projeto

```
todo-macos/
├── App/
│   └── todo_macosApp.swift          # Entry point da aplicação
├── Models/
│   ├── Todo.swift                   # Modelo de tarefa
│   └── Subject.swift                # Modelo de categoria
├── ViewModels/
│   └── TodoViewModel.swift          # Gerenciamento de estado e lógica
├── Views/
│   ├── ContentView.swift            # Lista principal de subjects
│   └── SubjectDetailView.swift      # Detalhes e tarefas do subject
└── Helpers/
    └── WindowAccessor.swift         # Utilitário para acesso à janela
```

## Destaques Técnicos

- **ObservableObject** e **@Published**: Reatividade automática com Combine
- **didSet**: Persistência automática em UserDefaults a cada modificação
- **Codable**: Serialização JSON transparente para persistência
- **NavigationSplitView**: Layout adaptativo master-detail nativo do macOS
- **Identifiable**: Identificação única de entidades para listas SwiftUI
- **@StateObject** e **@ObservedObject**: Gerenciamento de ciclo de vida de ViewModels

## Requisitos

- macOS 13.0+
- Xcode 14.0+
- Swift 5.7+

