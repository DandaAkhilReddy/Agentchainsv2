# Agentchains.ai

AI Agent Workflow Platform - iOS App

## Setup Instructions

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.9 or later
- Firebase account

### Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project named "agentchains-ai"
3. Add an iOS app to your Firebase project
4. Register your app with bundle ID: `com.agentchains.ai`
5. Download `GoogleService-Info.plist` and add it to `Agentchains.ai/Resources/`
6. Enable the following Firebase services:
   - **Authentication** (Email/Password, Google Sign-In)
   - **Firestore Database** (Start in test mode for development)
   - **Storage** (For file uploads)
   - **Analytics** (Optional)

### Running the App

1. Open the project in Xcode:
   ```bash
   open Agentchains.ai.xcodeproj
   ```

2. Wait for Swift Package Manager to resolve dependencies

3. Ensure `GoogleService-Info.plist` is in the project

4. Select your target device/simulator

5. Build and run (⌘R)

## Project Structure

```
Agentchains.ai/
├── Models/          # Data models
├── Views/           # SwiftUI views
├── ViewModels/      # View models
├── Services/        # Firebase and API services
└── Resources/       # Assets and configuration files
```

## Technologies

- **SwiftUI** - Modern declarative UI framework
- **Firebase** - Backend services (Auth, Firestore, Storage)
- **Swift Package Manager** - Dependency management
- **iOS 17+** - Target platform

## License

MIT
