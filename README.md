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

✅ **Page 1: Welcome/Landing Screen** - Entry point with branding
✅ **Page 2: Login Screen** - Email/password login form
✅ **Page 3: Sign Up Screen** - Registration with password strength indicator
✅ **Page 4: Home Screen with Map** - Google Maps overview with parking spots

## 🚀 How to Run on Android

### Prerequisites
1. **Flutter SDK**: https://flutter.dev/docs/get-started/install
2. **Android Studio**: https://developer.android.com/studio
3. **Git**: https://git-scm.com

### Quick Setup

```bash
# 1. Clone the repository
git clone https://github.com/sancimon/FlutterApp.git
cd FlutterApp

# 2. Generate complete platform files (IMPORTANT!)
flutter create . --org com.parkshare

# 3. Install dependencies
flutter pub get

# 4. Run on Android emulator
flutter emulators --launch Pixel_7  # Start emulator (or use Android Studio)
flutter run                         # Run the app

# OR run on Chrome for quick preview
flutter run -d chrome
```

### ⚠️ Important: First Time Setup

The `flutter create .` command is **required** to generate Android/iOS platform files. It will:
- Generate complete Android/iOS/Web folders
- Keep all your existing Dart code intact (lib/ folder)
- Make the project 100% runnable

Without this command, you'll get "gradle wrapper missing" errors.

## 📂 Project Structure

```
FlutterApp/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── screens/
│   │   ├── welcome_screen.dart      # Landing page
│   │   ├── login_screen.dart        # Login page
│   │   ├── signup_screen.dart       # Sign up page
│   │   └── home_screen.dart         # Home with map
│   └── utils/
│       └── app_theme.dart           # Color theme & styles
├── android/                         # Android platform (generated)
├── ios/                             # iOS platform (generated)
├── web/                             # Web platform (generated)
└── pubspec.yaml                     # Dependencies
```

## 🎯 App Features (Presentation Mode)

✅ **Working UI Flow:**
- Welcome → Login → Home with Map
- Welcome → Sign Up → Home with Map
- All buttons navigate correctly
- Password strength indicator
- Form validations

⏳ **Coming Soon (Backend):**
- Firebase authentication
- Google Maps real integration
- Booking system
- Payment processing

## 📱 For Presentation

The app is ready to demonstrate:
1. **Beautiful UI** - Professional dark blue theme
2. **Complete navigation** - All screens connected
3. **Interactive forms** - Real-time validation & feedback
4. **Map overview** - Parking spots visualization
5. **Smooth animations** - Native Flutter performance

No backend needed yet - perfect for UI/UX presentations!

## 🐛 Troubleshooting

### Error: "gradle wrapper missing"
```bash
flutter create . --org com.parkshare
flutter pub get
```

### Error: "No devices available"
```bash
# Start Android emulator
flutter emulators --launch Pixel_7

# Or list available emulators
flutter emulators
```

### Error: "pubspec.yaml" issues
```bash
flutter clean
flutter pub get
```

### Check Flutter installation
```bash
flutter doctor
```

## 🔧 Dependencies

- `google_fonts` - Beautiful typography
- `font_awesome_flutter` - Icon library
- `google_maps_flutter` - Maps integration
- `firebase_core` - Backend (setup pending)
- `flutter_stripe` - Payments (setup pending)

## 💡 Development Notes

This project is optimized for **presentation and UI demonstration**. Backend features (authentication, real-time booking, payments) will be added after UI approval.

Current focus: **Beautiful, functional UI that impresses stakeholders!**
