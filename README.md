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

### Core User Flow
✅ **Page 1: Welcome/Landing Screen** - Entry point with branding and social login
✅ **Page 2: Login Screen** - Email/password login form with validation
✅ **Page 3: Sign Up Screen** - Registration with password strength indicator
✅ **Page 4: Home Screen with Map** - Interactive map with parking spots list
✅ **Page 5: Parking Spot Detail** - Full details with photos, amenities, reviews
✅ **Page 6: Booking/Reservation** - Date/time picker with real-time price calculator
✅ **Page 7: Payment** - Multiple payment methods, promo codes (FIRST10 = 10% off)
✅ **Page 8: Booking Confirmation** - Success screen with QR code and booking details

### User Management
✅ **Page 9: My Bookings** - Upcoming/Past tabs with cancel/review functionality
✅ **Page 10: Profile Screen** - User profile with menu sections (Bookings, Host, Account, Support)
✅ **Page 11: Edit Profile** - Full profile editing with photo upload, bio, and settings

### Host Features
✅ **Page 12: Add Parking Spot** - 5-step form (Basic Info, Location, Pricing, Amenities, Availability)

### Additional Features
✅ **Search & Filters** - Comprehensive filtering (price, distance, type, amenities, availability)
✅ **Settings** - Notifications, app preferences, privacy, data management
✅ **Help & Support** - FAQs, live chat, email, phone support, issue reporting

**Total: 15+ fully functional screens with complete navigation flow!**

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

### 💡 Key Points for Presentation

✅ **Must run `flutter create .` first time** - Generates Android/iOS files
✅ **No backend needed** - All UI/navigation works without APIs
✅ **Mock data** - Parking spots are hardcoded for demo
✅ **Every button responds** - Nothing breaks!

## 📂 Project Structure

```
FlutterApp/
├── lib/
│   ├── main.dart                              # App entry point
│   ├── screens/
│   │   ├── welcome_screen.dart                # Landing page
│   │   ├── login_screen.dart                  # Login page
│   │   ├── signup_screen.dart                 # Sign up page
│   │   ├── home_screen.dart                   # Home with map & navigation
│   │   ├── parking_spot_detail_screen.dart    # Spot details
│   │   ├── booking_screen.dart                # Booking/reservation
│   │   ├── payment_screen.dart                # Payment processing
│   │   ├── booking_confirmation_screen.dart   # Booking success
│   │   ├── my_bookings_screen.dart            # User bookings list
│   │   ├── profile_screen.dart                # User profile
│   │   ├── edit_profile_screen.dart           # Edit profile
│   │   ├── add_parking_spot_screen.dart       # Add new parking spot
│   │   ├── search_filters_screen.dart         # Search & filters
│   │   ├── settings_screen.dart               # App settings
│   │   └── help_support_screen.dart           # Help & support
│   └── utils/
│       └── app_theme.dart                     # Color theme & styles
├── android/                                   # Android platform (generated)
├── ios/                                       # iOS platform (generated)
├── web/                                       # Web platform (generated)
└── pubspec.yaml                               # Dependencies
```

## 🎯 App Features (Presentation Mode)

✅ **Complete User Flow:**
- Welcome → Login/Sign Up → Home → Browse Spots → Book → Pay → Confirmation
- Full navigation between all 15+ screens
- Bottom navigation bar (Home, Bookings, Add Spot, Profile)

✅ **Interactive Features:**
- Password strength indicator with real-time feedback
- Form validations on all input fields
- Date/time pickers for bookings
- Price calculator with service fees
- Promo code system (FIRST10 works!)
- Tab-based bookings (Upcoming/Past)
- Search and comprehensive filtering system
- Settings with multiple preference options

✅ **User Management:**
- Profile viewing and editing
- Booking history with cancel/review options
- Settings and notification preferences
- Help & support with FAQs

✅ **Host Features:**
- Multi-step parking spot listing form
- Amenity selection
- Pricing and availability configuration

⏳ **Coming Soon (Backend):**
- Firebase authentication
- Google Maps real integration with live location
- Real-time booking system
- Stripe payment processing
- Photo upload functionality
- Push notifications

## 📱 For Presentation

The app is ready to demonstrate:
1. **Beautiful UI** - Professional dark blue theme with consistent design language
2. **Complete navigation** - All 15+ screens fully connected with smooth transitions
3. **Interactive forms** - Real-time validation, password strength, date/time pickers
4. **Full booking flow** - Search → Select → Book → Pay → Confirm
5. **Map overview** - Interactive parking spots visualization
6. **User features** - Profile management, bookings history, settings
7. **Host features** - Multi-step parking spot listing process
8. **Search & filtering** - Comprehensive filter options (price, distance, amenities)
9. **Help system** - FAQs, support options, issue reporting
10. **Smooth animations** - Native Flutter performance throughout

**Everything works without backend - perfect for UI/UX demonstrations and investor presentations!**

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
