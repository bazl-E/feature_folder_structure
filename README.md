# Feature Folder CLI Plus 📁

A powerful Dart CLI tool that generates clean, scalable folder structures following the **feature-first architecture** pattern. Stop wasting time creating repetitive boilerplate - generate complete feature modules in seconds!

[![Pub Version](https://img.shields.io/pub/v/feature_folder_cli_plus)](https://pub.dev/packages/feature_folder_cli_plus)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## 🚀 Quick Start

### 1. Install

```sh
dart pub global activate feature_folder_cli_plus
```

### 2. Generate a feature

```sh
ff generate -n auth -t bloc
```

That's it! Your complete `auth` feature folder is ready. ✅

---

## ✨ What's New in V2.0

| Before (v1.x) | Now (v2.0) |
|---------------|------------|
| ❌ Required Mason dependency | ✅ Zero external dependencies |
| ❌ Network calls to fetch templates | ✅ Instant offline generation |
| ❌ Breaks when Mason updates | ✅ Self-contained & stable |

---

## 📦 Installation

```sh
dart pub global activate feature_folder_cli_plus
```

> **Note:** Make sure Dart's bin directory is in your PATH.  
> Usually: `~/.pub-cache/bin` (macOS/Linux) or `%LOCALAPPDATA%\Pub\Cache\bin` (Windows)

---

## 🛠️ Usage

```sh
ff generate -n <name> -t <type> [-p <path>]
```

| Flag | Description | Required |
|------|-------------|----------|
| `-n` | Feature name (e.g., `auth`, `home`, `profile`) | ✅ |
| `-t` | State management type | ✅ |
| `-p` | Custom path inside `lib/` folder | ❌ |

### Supported State Management Types

| Type | Flag | Package Required |
|------|------|------------------|
| **BLoC** | `-t bloc` | `flutter_bloc` |
| **Cubit** | `-t cubit` | `flutter_bloc` |
| **Provider** | `-t provider` | `provider` |
| **GetX** | `-t getx` | `get` |

---

## 📋 Examples

### Basic Usage

```sh
# Generate a BLoC feature in lib/
ff generate -n auth -t bloc

# Generate a Cubit feature in lib/
ff generate -n home -t cubit

# Generate a Provider feature in lib/
ff generate -n profile -t provider

# Generate a GetX feature in lib/
ff generate -n settings -t getx
```

### With Custom Path

```sh
# Generate inside lib/features/
ff generate -n auth -t bloc -p features

# Generate inside lib/modules/
ff generate -n payment -t cubit -p modules
```

---

## 📂 Generated Structure

### BLoC / Cubit

```
lib/
└── auth/
    ├── index.dart
    ├── domain/
    │   ├── index.dart
    │   ├── models/
    │   │   ├── auth_model.dart
    │   │   └── index.dart
    │   ├── repository/
    │   │   ├── auth_repository.dart    ← Abstract class
    │   │   └── index.dart
    │   └── services/
    │       ├── auth_service.dart       ← Implements repository
    │       └── index.dart
    ├── logic/
    │   ├── index.dart
    │   └── auth_bloc/
    │       ├── auth_bloc.dart
    │       ├── auth_event.dart
    │       └── auth_state.dart
    ├── screens/
    │   ├── auth_screen.dart
    │   └── index.dart
    └── widgets/
        ├── auth_component.dart
        └── index.dart
```

### Provider / GetX

```
lib/
└── auth/
    ├── index.dart
    ├── domain/
    │   ├── index.dart
    │   ├── models/
    │   ├── repository/              ← Abstract class
    │   └── services/                ← Implements repository
    ├── providers/
    │   ├── auth_provider.dart       (Provider)
    │   ├── auth_controller.dart     (GetX)
    │   ├── auth_binding.dart        (GetX only)
    │   └── index.dart
    ├── screens/
    │   └── auth_screen.dart
    └── widgets/
        └── auth_component.dart
```

---

## 🏗️ Architecture Pattern

This CLI follows the **Repository Pattern** with clean separation:

```
┌─────────────────────────────────────────────────────┐
│                      UI Layer                        │
│              (screens/ & widgets/)                   │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                  Logic Layer                         │
│     (bloc/ cubit/ provider/ controller/)            │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                 Domain Layer                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │   Models    │  │ Repository  │  │  Services   │  │
│  │  (data)     │  │ (abstract)  │◄─│ (implement) │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
└─────────────────────────────────────────────────────┘
```

- **Repository**: Abstract class defining the contract
- **Service**: Concrete implementation of the repository
- **This enables easy testing and dependency injection!**

---

## 💡 Pro Tips

1. **Use barrel files**: Each folder has an `index.dart` for clean imports
   ```dart
   // Instead of this:
   import 'package:app/auth/domain/models/auth_model.dart';
   import 'package:app/auth/domain/repository/auth_repository.dart';
   
   // Just do this:
   import 'package:app/auth/index.dart';
   ```

2. **Consistent naming**: The CLI automatically converts your feature name to lowercase
   ```sh
   ff generate -n UserProfile -t bloc  # Creates "userprofile" folder
   ff generate -n user_profile -t bloc # Creates "user_profile" folder ✅
   ```

3. **Organize by feature**: Use the `-p` flag to group related features
   ```sh
   ff generate -n login -t bloc -p auth
   ff generate -n register -t bloc -p auth
   ff generate -n forgot_password -t bloc -p auth
   ```

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit PRs.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/bazl-E">bazl-E</a>
</p>
