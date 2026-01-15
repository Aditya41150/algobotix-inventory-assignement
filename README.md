# AlgoBotix Inventory Management App

A comprehensive Flutter-based Android application for inventory management with local database persistence, image handling, and QR code scanning capabilities.

## Features

### Mandatory Features ✅

1. **Product Management**
   - Unique Product ID validation (exactly 5 alphanumeric characters)
   - Product attributes: Name, Description, Current Stock
   - Image selection from Gallery or Camera
   - Metadata: Timestamp and "Added By" username (hardcoded as "Admin")
   - SQLite local database for persistent storage

2. **Core Functionality**
   - **Home Screen**: Displays all products with search functionality
   - **Search Bar**: Filter products by Product ID
   - **CRUD Operations**: 
     - Create new products
     - View product details
     - Edit existing products
     - Delete products
   - **Stock Management**: Increment/decrement controls with custom update option

### Bonus Features ⭐

1. **QR Code Search**
   - Scan QR codes to search for products
   - Direct navigation to product details from scan results

2. **Stock History**
   - Chronological log of all stock changes
   - Tracks increase/decrease amounts
   - Displays previous and new stock values
   - Timestamps for each change

## Technical Stack

### Packages Used

| Package | Version | Purpose |
|---------|---------|---------|
| `sqflite` | ^2.3.0 | Local SQLite database |
| `path_provider` | ^2.1.1 | Access device file system paths |
| `path` | ^1.8.3 | Path manipulation utilities |
| `image_picker` | ^1.0.5 | Camera and gallery image selection |
| `intl` | ^0.19.0 | Date and time formatting |
| `qr_code_scanner` | ^1.0.1 | QR code scanning functionality |
| `provider` | ^6.1.1 | State management |

### Architecture

- **State Management**: Provider pattern
- **Database**: SQLite with custom helper class
- **Design Pattern**: MVC (Model-View-Controller)
- **UI Framework**: Material Design 3

## Project Structure

```
lib/
├── database/
│   └── database_helper.dart      # SQLite database operations
├── models/
│   ├── product.dart               # Product data model
│   └── stock_history.dart         # Stock history data model
├── providers/
│   └── product_provider.dart      # State management
├── screens/
│   ├── home_screen.dart           # Main product list screen
│   ├── add_edit_product_screen.dart  # Add/Edit product form
│   ├── product_detail_screen.dart    # Product details & stock management
│   └── qr_scanner_screen.dart        # QR code scanner
└── main.dart                      # App entry point
```

## Database Schema

### Products Table
```sql
CREATE TABLE products (
  id TEXT PRIMARY KEY,              -- 5 alphanumeric characters
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  currentStock INTEGER NOT NULL,
  imagePath TEXT,                   -- Path to product image
  addedBy TEXT NOT NULL,            -- Username (hardcoded as "Admin")
  timestamp TEXT                    -- ISO 8601 format
)
```

### Stock History Table
```sql
CREATE TABLE stock_history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  productId TEXT,
  changeAmount INTEGER NOT NULL,    -- Positive or negative change
  previousStock INTEGER NOT NULL,
  newStock INTEGER NOT NULL,
  timestamp TEXT,
  FOREIGN KEY (productId) REFERENCES products (id) ON DELETE CASCADE
)
```

## Key Features Implementation

### Product ID Validation
- Regex pattern: `^[a-zA-Z0-9]{5}$`
- Enforced at form validation level
- Uniqueness checked before insertion

### Stock Management
- **Quick Controls**: +1 and -1 buttons on detail screen
- **Custom Update**: Dialog for bulk add/remove
- **History Tracking**: All changes logged with timestamps
- **Negative Prevention**: Stock cannot go below 0

### Image Handling
- Camera capture support
- Gallery selection support
- Images stored in device storage
- Fallback icon for products without images

### Search Functionality
- Real-time filtering by Product ID
- Case-insensitive search
- QR code integration for quick lookup

## Setup Instructions

### Prerequisites
- Flutter SDK (3.38.6 or higher)
- Android Studio / VS Code
- Android device or emulator (API 21+)

### Installation

1. **Clone/Download the project**
   ```bash
   cd algobotix_inventory
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build APK**
   ```bash
   flutter build apk --release
   ```
   The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

## Permissions

The app requires the following Android permissions:
- `CAMERA` - For taking product photos and QR scanning
- `READ_EXTERNAL_STORAGE` - For selecting images from gallery
- `WRITE_EXTERNAL_STORAGE` - For saving images (Android 12 and below)
- `INTERNET` - For potential future features

## Usage Guide

### Adding a Product
1. Tap the **"+ Add Product"** floating action button
2. Fill in all required fields:
   - Product ID (exactly 5 alphanumeric characters)
   - Product Name
   - Description
   - Initial Stock quantity
3. Optionally add an image from camera or gallery
4. Tap **"Add Product"**

### Viewing Products
- All products are displayed on the home screen
- Stock levels are color-coded:
  - 🔴 Red: Stock < 10 (Low)
  - 🟠 Orange: Stock 10-49 (Medium)
  - 🟢 Green: Stock ≥ 50 (Good)

### Searching Products
- Use the search bar to filter by Product ID
- Or tap the QR scanner icon to scan a product QR code

### Managing Stock
1. Tap on a product to view details
2. Use **+** or **-** buttons for quick adjustments
3. Or tap **"Custom Stock Update"** for bulk changes
4. View complete stock history at the bottom

### Editing/Deleting
- Tap the **edit icon** in the app bar to modify product details
- Tap the **delete icon** to remove a product (with confirmation)

## Design Highlights

- **Modern UI**: Material Design 3 with custom color scheme
- **Intuitive Navigation**: Clear visual hierarchy
- **Responsive Cards**: Elevation and rounded corners
- **Color-Coded Feedback**: Stock levels, history changes
- **Empty States**: Helpful messages when no data exists
- **Pull-to-Refresh**: Update product list easily

## Screenshots

[Screenshots would be included in the PDF documentation]

## Future Enhancements

- Export data to CSV/Excel
- Product categories and filtering
- Barcode generation for products
- Multi-user support with authentication
- Cloud backup and sync
- Analytics dashboard
- Low stock notifications

## Developer Notes

- **Hardcoded Username**: "Admin" is used for all products (as per requirements)
- **Image Storage**: Images are stored locally; consider cloud storage for production
- **Database**: SQLite is suitable for single-user local storage
- **QR Scanner**: Requires camera permission and physical device for testing

## License

All rights to the source code remain solely with the applicant. This project is submitted as part of the AlgoBotix Flutter Development assessment.

---

**Developed by**: [Your Name]  
**Date**: January 2026  
**Assignment**: AlgoBotix Flutter Development Assessment
