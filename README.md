# NFT Gallery & Portfolio Dashboard

A production-ready Flutter application for browsing NFT galleries and managing a portfolio dashboard. This project is built utilizing a strict Clean Architecture approach to ensure scalability, testability, and maintainability.

## 🚀 Features

* **Clean Architecture:** Separation of concerns into Data, Domain, and Presentation layers.
* **Robust State Management:** Powered by `flutter_riverpod` for predictable and scalable state handling.
* **Type-Safe Data Models:** Utilizing `freezed` and `json_serializable` for immutable data classes and safe JSON parsing.
* **Smooth Animations & UI:** Integrated `flutter_animate` for fluid transitions and `shimmer` for elegant loading states.
* **Optimized Networking:** Fast and reliable API requests handled via `dio`, with `cached_network_image` for performant asset loading.
* **Modern Typography:** Styled with `google_fonts`.

## 🛠 Tech Stack & Libraries

* **Framework:** [Flutter](https://flutter.dev/) (SDK: >=3.2.0 <4.0.0)
* **State Management:** [Riverpod](https://pub.dev/packages/flutter_riverpod)
* **Networking:** [Dio](https://pub.dev/packages/dio)
* **Code Generation:** [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable)
* **Animations:** [Flutter Animate](https://pub.dev/packages/flutter_animate)
* **UI Helpers:** [Shimmer](https://pub.dev/packages/shimmer), [Cached Network Image](https://pub.dev/packages/cached_network_image)

## 📁 Architecture Overview

This project follows Clean Architecture principles, generally structured as follows:

```text
lib/
├── core/               # Shared utilities, constants, themes, and network clients
├── features/           # Feature-based organization
│   ├── portfolio/      # Example feature directory
│   │   ├── data/       # Repositories, data sources, and DTOs
│   │   ├── domain/     # Entities, use cases, and repository interfaces
│   │   └── presentation/ # UI screens, widgets, and Riverpod providers
└── main.dart           # App entry point
