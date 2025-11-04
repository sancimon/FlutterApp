# ParkShare - Parking Spot Rental App

A Flutter mobile application for finding and reserving parking spots.

## 🎨 Design Theme

**Main Colors:**
- Primary Blue: #1E3A5F (Deep navy blue - easy on eyes)
- Secondary Blue: #2C5F8D
- Accent Blue: #4A90E2

**Fonts:**
- Headings: Poppins (bold, clean)
- Body text: Inter (readable)

## 📱 Pages Completed

### ✅ Page 1: Welcome/Landing Screen
- Clean gradient background (dark blue)
- ParkShare logo with parking icon
- **Login** button (white background)
- **Sign Up** button (outlined white)
- Social sign-in options:
  - Google
  - Apple
  - Facebook
- Terms & Privacy notice

## 🚀 How to Run

### Prerequisites
1. Install Flutter SDK: https://flutter.dev/docs/get-started/install
2. Install Android Studio (for emulator)
3. Install Git

### Setup Steps

```bash
# 1. Clone the repository
git clone https://github.com/sancimon/FlutterApp.git
cd FlutterApp

# 2. Checkout the development branch
git checkout claude/flutter-flow-mobile-app-011CUoHpfTLEGAEpRZ4ZhWGj

# 3. Get dependencies
flutter pub get

# 4. Run on emulator or device
flutter run

# Or run on specific device
flutter devices              # See available devices
flutter run -d chrome        # Run on Chrome browser (fastest for testing)
flutter run -d emulator-5554 # Run on Android emulator
```

## 🧪 Quick Test (Web Browser)

The fastest way to see the app:

```bash
flutter run -d chrome
```

This opens the app in your web browser immediately!

## 📂 Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   └── welcome_screen.dart   # Landing page
└── utils/
    └── app_theme.dart        # Colors, fonts, theme
```

## 🔧 Dependencies

- google_fonts - Beautiful fonts
- font_awesome_flutter - Social media icons
- firebase_core, firebase_auth - Authentication (coming next)
- google_maps_flutter - Maps integration (coming next)
- flutter_stripe - Payments (coming next)

## 📸 Screenshots

### Welcome Screen
- Gradient blue background
- App logo with parking icon
- Primary action buttons (Login/Sign Up)
- Social sign-in options below
- Clean, modern design

## 🎯 Next Pages

Tell me what Page 2 should be! Options:
- Login screen (email/password form)
- Sign up screen (registration form)
- Home screen with map
- Or something else?

## 💬 Need Help?

If you get errors running the app, check:
1. Flutter is installed: `flutter doctor`
2. Dependencies are installed: `flutter pub get`
3. At least one device available: `flutter devices`

Common fixes:
```bash
flutter clean
flutter pub get
flutter run
```
