# Quick Start Guide - AlgoBotix Inventory

## Prerequisites Check
```bash
flutter doctor
```

## Installation Steps

### 1. Install Dependencies
```bash
cd algobotix_inventory
flutter pub get
```

### 2. Check for Issues
```bash
flutter analyze
```

### 3. Run on Device/Emulator
```bash
# List available devices
flutter devices

# Run on connected device
flutter run

# Run in release mode
flutter run --release
```

### 4. Build APK
```bash
# Build release APK
flutter build apk --release

# Build split APKs (smaller size)
flutter build apk --split-per-abi

# APK location
# build/app/outputs/flutter-apk/app-release.apk
```

## Testing Checklist

### Basic Functionality
- [ ] App launches successfully
- [ ] Home screen displays correctly
- [ ] Can add a new product
- [ ] Product ID validation works (exactly 5 alphanumeric)
- [ ] Can select image from gallery
- [ ] Can capture image from camera
- [ ] Products display on home screen
- [ ] Search bar filters products
- [ ] Can view product details
- [ ] Can edit product
- [ ] Can delete product (with confirmation)

### Stock Management
- [ ] Can increment stock (+1 button)
- [ ] Can decrement stock (-1 button)
- [ ] Custom stock update dialog works
- [ ] Stock cannot go negative
- [ ] Stock history is recorded
- [ ] Stock history displays correctly

### Bonus Features
- [ ] QR scanner opens
- [ ] QR scanner can scan codes
- [ ] Scanned code populates search
- [ ] Stock history shows all changes
- [ ] History shows timestamps
- [ ] History shows +/- indicators

### UI/UX
- [ ] Color-coded stock levels (red/orange/green)
- [ ] Pull-to-refresh works
- [ ] Empty states display correctly
- [ ] Loading indicators show
- [ ] Success/error messages appear
- [ ] Navigation flows smoothly

## Common Issues & Solutions

### Issue: "Waiting for another flutter command"
**Solution**: Kill all Flutter processes
```bash
# Windows
taskkill /F /IM dart.exe
taskkill /F /IM flutter.exe

# Then retry
flutter pub get
```

### Issue: Camera permission denied
**Solution**: Grant permissions in Android settings or reinstall app

### Issue: QR scanner not working
**Solution**: 
- Test on physical device (not emulator)
- Ensure camera permission is granted
- Check minSdk is 21 or higher

### Issue: Images not displaying
**Solution**: 
- Check storage permissions
- Verify image path is saved correctly
- Test on physical device

### Issue: Database errors
**Solution**:
- Clear app data
- Uninstall and reinstall
- Check database helper initialization

## File Structure Overview

```
algobotix_inventory/
├── lib/
│   ├── database/
│   │   └── database_helper.dart
│   ├── models/
│   │   ├── product.dart
│   │   └── stock_history.dart
│   ├── providers/
│   │   └── product_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── add_edit_product_screen.dart
│   │   ├── product_detail_screen.dart
│   │   └── qr_scanner_screen.dart
│   └── main.dart
├── android/
│   └── app/
│       └── src/
│           └── main/
│               └── AndroidManifest.xml
├── pubspec.yaml
├── README.md
└── DOCUMENTATION.md
```

## Key Files Modified

1. **pubspec.yaml** - Dependencies
2. **AndroidManifest.xml** - Permissions
3. **build.gradle.kts** - minSdk version
4. **All files in lib/** - Application code

## Submission Checklist

- [ ] Source code (complete Flutter project)
- [ ] APK file (app-release.apk)
- [ ] Documentation PDF with:
  - [ ] App screenshots
  - [ ] Features description
  - [ ] Packages used
  - [ ] Brief implementation notes

## Building for Submission

```bash
# 1. Clean build
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Build release APK
flutter build apk --release

# 4. Locate APK
# File: build/app/outputs/flutter-apk/app-release.apk

# 5. Test APK installation
adb install build/app/outputs/flutter-apk/app-release.apk
```

## Screenshots to Include

1. **Home Screen** - Empty state
2. **Home Screen** - With products
3. **Add Product** - Form filled
4. **Product Detail** - Full view
5. **Stock History** - Multiple entries
6. **QR Scanner** - Active scanning
7. **Search** - Filtered results
8. **Edit Product** - Form view

## Performance Tips

- Test on physical device for best experience
- QR scanner requires physical camera
- Image picker works better on real device
- Database operations are fast on device

## Support

For issues or questions:
1. Check this guide
2. Review README.md
3. Check DOCUMENTATION.md
4. Review Flutter documentation

---

**Ready to Submit!**

Make sure you have:
1. ✅ Complete source code
2. ✅ Tested APK file
3. ✅ Documentation PDF
4. ✅ All features working

**Deadline**: Friday, 16th January 2026, 10:00 AM

Good luck! 🚀
