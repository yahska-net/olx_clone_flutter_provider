🚀 OLX Clone - Flutter App

A Flutter-based OLX Clone with Firebase Authentication and Provider for state management.

📌 Features

✅ User Authentication (Sign Up, Login, Logout)
✅ Firebase Integration (Firebase Auth)
✅ Bottom Navigation Bar (Home, Chats, Sell, My Ads, Account)
✅ Provider for State Management
✅ Dynamic UI Based on Authentication

⸻

🔧 Installation

1️⃣ Clone the repo

git clone https://github.com/akshaykumarkm/olx_clone_flutter_provider.git
cd olx_clone_flutter_provider

2️⃣ Install dependencies

flutter pub get

3️⃣ Setup Firebase
• Create a Firebase project
• Download google-services.json (Android) & GoogleService-Info.plist (iOS)
• Place them in android/app/ and ios/Runner/

4️⃣ Run the app

flutter run

⸻

📜 Authentication Flow

1️⃣ User opens the app → AuthWrapper checks authentication state
2️⃣ If logged in → Redirects to MainScreen
3️⃣ If not logged in → Shows LoginScreen
4️⃣ User can Sign Up / Login using Firebase Auth

⸻

🛠️ Tech Stack
• Flutter
• Firebase Authentication
• Provider (State Management)
• Dart
• Material UI

⸻

📝 Contributors

👤 @akshaykumarkm - GitHub Profile

⸻

📜 License

This project is licensed under the MIT License.

⸻
