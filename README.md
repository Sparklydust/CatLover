# CatLover

## Overview

CatLover is an iOS application developed as an assessment test for Liberty Rider. This app is crafted in Swift and designed to showcase a list of cat breeds, allowing users to navigate and view details of each breed, including images. 

## Objective

The goal of this assessment was to create an app that displays cat or dog breeds using an external API, allowing for category-based navigation with offline caching of previously viewed data. The following was requested:

- **Display Breeds**: Show a list of breeds with images and allow navigation to breed details.
- **Offline Caching**: Cache data to enable offline usage after initial load.
- **Architecture**: Use any architectural patterns for separation of concerns.
- **Search Feature**: Allow search functionality to find breeds.
- **External Libraries**: Optional for dependency injection.
- **Testing**: Optional but encouraged.

## Features

- Project runs on Xcode 16 and above.
- Supports iPhone on iOS 18 and above.
- Uses MVVM architecture with SwiftUI for clean separation of UI and logic.
- Displays a list of cat breeds with details on lifespan, origin, and temperament.
- Breed search with dynamic filtering.
- Caches images and data for offline accessibility using `NSCache`, `FileManager`, and `SwiftData`.

## Setup Instructions

1. Clone the repository and open the project in Xcode on the main or develop branch.
2. Obtain an API key from [TheCatAPI](https://thecatapi.com) and add it to Xcode as an environment variable:
3. Add the key to the Info.plist:
   - Go to `CatLover/Configurations/Info.plist`.
   - Add your API key under the `CAT_API_KEY` key.
4. Run the app on your simulator or device.

## Architecture

The app uses **MVVM** (Model-View-ViewModel) architecture, separating UI components and business logic, while utilizing `SwiftUI` for views. `Factory` is used for dependency injection to enhance modularity and make the app easily testable.

### Dependency Injection with Factory

CatLover leverages the [Factory](https://github.com/hmlongco/Factory) package for dependency injection, enhancing code modularity and testability.

- **Modularity**: Ensures that components are loosely connected, making it easy to modify or extend functionality.
- **Testability**: Simplifies mocking of dependencies, which helps in unit testing.
- **Simplicity**: Reduces the complexity of setup, with clear dependency management.

## Caching Strategy

- **Image Caching**: Utilizes `NSCache` for in-memory storage of images and `FileManager` for disk persistence, enabling offline access.
- **Data Caching**: Uses `SwiftData` to cache breed data, ensuring breeds are available offline once viewed.

This setup allows the user to access previously viewed breeds and images without internet access.

## Testing

The app includes unit tests using Swift’s Testing framework to verify key functionalities.

## License

CatLover is available under the MIT license.

## Contact

Reach out to roland.lariotte@gmail.com
