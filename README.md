<div align="center">
  <h1>TicketTerminal</h1>
</div>

**TicketTerminal** is a Swift-based iOS application designed to provide users with a comprehensive solution for managing tickets. The app offers features like trip planning, ticket searching, recommendations, and an intelligent (ChatGPT-based) assistant to help users navigate through their travel needs.

## Table of Contents 📋

- [Features](#features)
- [Technologies](#technologies)
- [Architecture](#architecture)
- [Requirements](#requirements)

<h2 id="features">Features ⚒️</h2>

### Main Module
- Central hub for accessing all app features
- Quick access to frequently used functions
- Real-time updates on ticket availability and prices

### Trips Module
- View and manage your upcoming trips
- Track trip status and details
- Access historical trip information
- Manage trip preferences and settings

### Buy Module
- Browse available tickets
- Filter and search for specific routes
- View detailed pricing information
- Secure payment processing
- Ticket confirmation and receipt generation

### Assistant Module
- Intelligent travel recommendations
- Real-time support and guidance
- Help with ticket selection and purchase
- Answer common travel-related questions

### Recommendations Module
- Personalized travel suggestions
- Popular routes and destinations
- Special offers and deals
- Seasonal travel recommendations

### Accessibility Module
- **Dynamic Type:**
  - Support for all text size categories
  - Automatic layout adjustments
  - Custom font scaling
- **Color and Contrast:**
  - High contrast mode support
  - Custom color schemes
  - Color blindness considerations
- **Multi-language Support:**
  - Dynamic language switching
  - Language-specific formatting
  - API localization support

<h2 id="technologies">Technologies 💻</h2>

### iOS Frameworks and Languages
- **Swift:** Primary development language
- **SwiftUI:** Modern UI framework for building responsive interfaces
- **UIKit:** Legacy UI components and custom views
- **Combine:** Reactive programming and data flow management

### Networking and Data Handling
- **URLSession:** Network request management
- **Alamofire:** Advanced networking capabilities
- **CoreLocation:** Location services integration

<h2 id="architecture">Architecture 🏗️</h2>

The application follows a modular MVVM (Model-View-ViewModel) architecture pattern, dividing functionality into distinct, reusable components:

### Module Structure
- **Application Module:** Localization and business rules
- **Presentation Module:** UI components and view controllers
- **Network Module:** Handles all API communications
- **Service Module:** Implements business logic
- **Helpers Module:** Extension business entities and models

<h2 id="requirements">Requirements ✅</h2>

- Xcode 15.0+
- Swift 5.0+
- iOS 18.0+
- SPM for dependency management
