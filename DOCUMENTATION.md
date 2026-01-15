# AlgoBotix Inventory - Documentation

## Application Overview

**AlgoBotix Inventory** is a comprehensive Flutter-based Android application designed for efficient inventory management. The app provides a complete solution for tracking products with local database persistence, image handling, and advanced features like QR code scanning.

---

## Features Implemented

### ✅ Mandatory Features

#### 1. Product Management
- **Product ID**: Unique 5-character alphanumeric identifier with validation
- **Attributes**:
  - Product Name
  - Description
  - Current Stock (integer value)
- **Media**: Image selection from Camera or Gallery
- **Metadata**:
  - Timestamp (Date and Time of creation)
  - Added By: "Admin" (hardcoded username)
- **Storage**: SQLite local database for persistent data storage

#### 2. Core Functionality

**Home Screen**
- Displays all products in a scrollable list
- Search bar for filtering products by Product ID
- Color-coded stock levels (Red: Low, Orange: Medium, Green: Good)
- Pull-to-refresh functionality
- Empty state with helpful messages

**CRUD Operations**
- ✅ **Create**: Add new products with validation
- ✅ **Read**: View all products and individual product details
- ✅ **Update**: Edit product information
- ✅ **Delete**: Remove products with confirmation dialog

**Stock Update**
- Quick increment/decrement buttons (+1, -1)
- Custom stock update dialog for bulk changes
- Real-time stock level updates
- Prevention of negative stock values

---

### ⭐ Bonus Features

#### 1. QR Code Search
- Integrated QR code scanner
- Quick product lookup by scanning QR codes
- Direct navigation to product details from scan results
- Camera permission handling

#### 2. Stock History
- Complete chronological log of all stock changes
- Tracks both increases and decreases
- Displays:
  - Change amount (+/- values)
  - Previous stock level
  - New stock level
  - Timestamp of each change
- Visual indicators (green for increase, red for decrease)

---

## Technical Implementation

### Packages Used

1. **sqflite** (^2.3.0) - SQLite database for local data persistence
2. **path_provider** (^2.1.1) - Access to device file system paths
3. **path** (^1.8.3) - Path manipulation utilities
4. **image_picker** (^1.0.5) - Camera and gallery image selection
5. **intl** (^0.19.0) - Date and time formatting
6. **qr_code_scanner** (^1.0.1) - QR code scanning functionality
7. **provider** (^6.1.1) - State management solution

### Architecture

- **Pattern**: Model-View-Controller (MVC)
- **State Management**: Provider
- **Database**: SQLite with custom DatabaseHelper class
- **UI Framework**: Flutter Material Design 3

### Database Schema

**Products Table**
```
- id: TEXT PRIMARY KEY (5 alphanumeric characters)
- name: TEXT NOT NULL
- description: TEXT NOT NULL
- currentStock: INTEGER NOT NULL
- imagePath: TEXT (nullable)
- addedBy: TEXT NOT NULL
- timestamp: TEXT (ISO 8601 format)
```

**Stock History Table**
```
- id: INTEGER PRIMARY KEY AUTOINCREMENT
- productId: TEXT (Foreign Key)
- changeAmount: INTEGER NOT NULL
- previousStock: INTEGER NOT NULL
- newStock: INTEGER NOT NULL
- timestamp: TEXT (ISO 8601 format)
```

---

## User Interface

### Design Principles
- **Modern Material Design 3**: Clean and contemporary UI
- **Color Scheme**: Indigo primary color (#6366F1)
- **Responsive Cards**: Elevated cards with rounded corners
- **Visual Feedback**: Color-coded stock levels and change indicators
- **Intuitive Navigation**: Clear hierarchy and flow

### Screens

1. **Home Screen**
   - Product list with search functionality
   - QR scanner button
   - Floating action button for adding products
   - Color-coded stock indicators

2. **Add/Edit Product Screen**
   - Form with validation
   - Image picker (Camera/Gallery)
   - Product ID uniqueness check
   - Save/Update button with loading state

3. **Product Detail Screen**
   - Product image display
   - Complete product information
   - Stock management controls
   - Edit and delete actions
   - Stock history timeline

4. **QR Scanner Screen**
   - Camera view with overlay
   - Real-time QR code detection
   - Automatic navigation on scan

---

## Key Features Explained

### Product ID Validation
- Enforces exactly 5 alphanumeric characters
- Uses regex pattern: `^[a-zA-Z0-9]{5}$`
- Checks uniqueness before insertion
- Converts to uppercase for consistency

### Stock Management
- **Quick Controls**: Single-tap increment/decrement
- **Custom Updates**: Dialog for bulk add/remove operations
- **History Tracking**: Every change is logged automatically
- **Validation**: Prevents negative stock values

### Image Handling
- **Camera Capture**: Take photos directly
- **Gallery Selection**: Choose existing images
- **Local Storage**: Images saved on device
- **Fallback UI**: Default icon when no image

### Search & Filter
- **Real-time Search**: Instant filtering as you type
- **Case-insensitive**: Matches regardless of case
- **QR Integration**: Scan to search feature
- **Clear Results**: Shows filtered or all products

---

## Installation & Setup

### Prerequisites
- Flutter SDK 3.38.6 or higher
- Android Studio or VS Code
- Android device or emulator (API 21+)

### Steps
1. Extract the project files
2. Open terminal in project directory
3. Run `flutter pub get` to install dependencies
4. Connect Android device or start emulator
5. Run `flutter run` to launch the app

### Building APK
```bash
flutter build apk --release
```
APK location: `build/app/outputs/flutter-apk/app-release.apk`

---

## Permissions Required

- **CAMERA**: For product photos and QR scanning
- **READ_EXTERNAL_STORAGE**: For gallery image selection
- **WRITE_EXTERNAL_STORAGE**: For saving images (Android ≤ 12)
- **INTERNET**: For future enhancements

---

## Usage Instructions

### Adding a Product
1. Tap the "+ Add Product" button
2. Enter Product ID (5 alphanumeric characters)
3. Fill in Name and Description
4. Set initial stock quantity
5. Optionally add an image
6. Tap "Add Product"

### Searching for Products
- Type Product ID in search bar, OR
- Tap QR scanner icon and scan a code

### Managing Stock
1. Tap on a product
2. Use +/- buttons for quick changes
3. Or use "Custom Stock Update" for bulk changes
4. View history at the bottom of the screen

### Editing/Deleting
- Tap edit icon to modify product
- Tap delete icon to remove (with confirmation)

---

## Screenshots

[Include screenshots of:]
1. Home Screen with products
2. Add Product Screen
3. Product Detail Screen
4. Stock History
5. QR Scanner
6. Search functionality

---

## Improvements & Innovations

Beyond the basic requirements, this app includes:

1. **Enhanced UX**: Pull-to-refresh, empty states, loading indicators
2. **Visual Feedback**: Color-coded stock levels, change indicators
3. **Data Validation**: Comprehensive form validation
4. **Error Handling**: User-friendly error messages
5. **Modern Design**: Material Design 3 with custom theming
6. **Performance**: Efficient database queries and state management

---

## Future Enhancements

- Export data to CSV/Excel
- Product categories and tags
- Barcode generation for products
- Multi-user authentication
- Cloud backup and synchronization
- Analytics and reporting dashboard
- Low stock notifications
- Batch operations

---

## Developer Information

**Project**: AlgoBotix Inventory Management App  
**Platform**: Android (Flutter)  
**Minimum SDK**: API 21 (Android 5.0)  
**Target SDK**: Latest  
**Language**: Dart  
**Framework**: Flutter 3.38.6  

---

## Conclusion

This application successfully implements all mandatory features and both bonus features as specified in the AlgoBotix Flutter Development assignment. The app demonstrates proficiency in:

- Flutter development
- SQLite database management
- State management with Provider
- Image handling
- QR code integration
- Material Design implementation
- Clean code architecture

All rights to this source code remain with the applicant.

---

**Submission Date**: January 15, 2026  
**Assignment**: AlgoBotix Flutter Development Assessment
