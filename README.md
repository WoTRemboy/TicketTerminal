<div align="center">
  <img src="https://github.com/user-attachments/assets/720c5972-1309-4b63-93d2-849d785f4607" alt="Image" width="200" height="200">
  <h1>TicketTerminal</h1>

</div>

**TicketTerminal** is a competition Swift-based iOS application designed to provide users with a comprehensive solution for managing tickets. The app offers features like trip planning, ticket searching, recommendations, and an intelligent (ChatGPT-based) assistant to help users navigate through their travel needs.

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

<img src="https://github.com/user-attachments/assets/c9210006-a87b-44a2-98a7-ef4fdf5a71b7" alt="Main Page" width="200" height="290">
<img src="https://github.com/user-attachments/assets/fb55e5d5-d835-4685-ac53-cbe81220f038" alt="Main Page + Accessibility" width="200" height="290">

### Tourist Routes Module
- View current available trips
- Learn trip details
- Access visiting points information

<img src="https://github.com/user-attachments/assets/4c81c1d5-c565-43f0-89c2-5fc2b5cab070" alt="Tourist Routes" width="200" height="290">
<img src="https://github.com/user-attachments/assets/163a9e37-de23-4839-a94d-a7d863ca39d4" alt="Tourist Routes + Accessibility" width="200" height="290">

### Buy Module
- Browse available tickets
- Filter and search for specific routes
- View detailed pricing information

<img src="https://github.com/user-attachments/assets/6459d439-27d8-4b64-b809-32361afa6cd2" alt="Buy Page" width="200" height="290">
<img src="https://github.com/user-attachments/assets/75646b71-db74-4af4-9335-4fc466501472" alt="Ticket Search Page" width="200" height="290">

### Assistant Module
- Intelligent travel recommendations
- Real-time support and guidance
- Help with ticket selection
- Answer common travel-related questions

<img src="https://github.com/user-attachments/assets/d24cc44d-c55f-4841-8250-62f809aad994" alt="Assistant Listening" width="200" height="290">
<img src="https://github.com/user-attachments/assets/950cba6f-b166-4070-ace2-ea905551ee31" alt="Assistant Answering" width="200" height="290">

### Recommendations Module
- Personalized travel suggestions
- Popular routes and destinations
- Special offers and deals
- Seasonal travel recommendations

<img src="https://github.com/user-attachments/assets/2a2d8413-fb34-4849-ae4c-c5a0a01c94df" alt="Recomendations" width="200" height="290">
<img src="https://github.com/user-attachments/assets/94ea9fdf-d1c2-4d79-8efb-3ebdce584469" alt="Recomendations + Accessibility" width="200" height="290">

### Accessibility Module
- **Dynamic Type:**
  - Support for all text size categories
  - Automatic layout adjustments
  - Custom font scaling

<img src="https://github.com/user-attachments/assets/adcb01c8-e1cf-4dc1-8543-fa8c525285f3" alt="Dynamic Type 1x" width="200" height="290">
<img src="https://github.com/user-attachments/assets/d94a2df3-40c9-44ab-a2f6-a3c3c0de2e44" alt="Dynamic Type 2x" width="200" height="290">

- **Color and Contrast:**
  - High contrast mode support
  - Custom color schemes
  - Color blindness considerations

<img src="https://github.com/user-attachments/assets/26e8ea7d-e27e-4e8b-8e45-48a50b9fc79f" alt="Color Contrast Off" width="200" height="290">
<img src="https://github.com/user-attachments/assets/77369900-1aa6-49ad-b717-bd7068090a79" alt="Color Contrast On" width="200" height="290">

- **Multi-language Support:**
  - Dynamic language switching
  - Language-specific formatting
  - API localization support

<img src="https://github.com/user-attachments/assets/2c19485d-329e-4646-b262-8b0cf9c096f0" alt="Russian Localization" width="200" height="290">
<img src="https://github.com/user-attachments/assets/cd64e4f1-1bc9-4c7e-a79e-ab6a0d9c918b" alt="Chinese Localization" width="200" height="290">

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
