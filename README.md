# 💉 Vaccine Certificate - Blockchain-Based Vaccination Management System

A decentralized vaccination certificate management system built with Flutter and Ethereum blockchain technology. This application provides a secure, transparent, and tamper-proof way to manage vaccination records using smart contracts.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Smart Contract Integration](#smart-contract-integration)
- [Contributing](#contributing)
- [License](#license)

## 🌟 Overview

The Vaccine Certificate application leverages blockchain technology to create an immutable and decentralized record of vaccination data. By using Ethereum smart contracts, the system ensures that vaccination records cannot be tampered with, providing trust and transparency in the vaccination certification process.

## ✨ Features

- **Blockchain Integration**: Secure vaccination records stored on Ethereum blockchain
- **Vaccination Status Tracking**: View and verify vaccination status in real-time
- **User Registration**: Register new users in the system
- **Statistics Dashboard**: View vaccination statistics and analytics
- **Wallet Management**: Create and manage Ethereum wallets
- **Smart Contract Interaction**: Direct interaction with deployed Ethereum smart contracts
- **Cross-Platform**: Runs on Android, iOS, and Web
- **Decentralized Storage**: No central authority can modify vaccination records

## 🛠 Technology Stack

### Frontend
- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Provider** - State management

### Blockchain
- **Ethereum** - Blockchain platform
- **web3dart** - Ethereum library for Dart
- **Ganache** - Local Ethereum blockchain for development (assumed)
- **Solidity** - Smart contract programming (contract artifact included)

### Additional Libraries
- `shared_preferences` - Local data persistence
- `path_provider` - File system access
- `filesystem_picker` - File selection
- `permission_handler` - Permission management
- `web_socket_channel` - WebSocket communication with blockchain

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (>=2.12.0 <3.0.0)
  - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **Xcode** (for mobile development)
- **Ganache** or any Ethereum test network
  - [Download Ganache](https://www.trufflesuite.com/ganache)
- **Git**

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Itsmegaurav47/vaccine--certificate.git
   cd vaccine--certificate
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```
   Fix any issues reported by the doctor command.

## ⚙️ Configuration

### 1. Blockchain Setup

Before running the application, you need to set up your Ethereum development environment:

1. **Start Ganache** (or your preferred Ethereum test network)
   - Default RPC Server: `http://192.168.0.5:7545`
   - WebSocket Server: `ws://192.168.0.5:7545/`

2. **Update Contract Configuration**
   
   Edit `lib/api/contract_linking.dart` to match your network settings:
   ```dart
   final String _rpcUrl = "http://YOUR_IP:7545";
   final String _wsUrl = "ws://YOUR_IP:7545/";
   final String _privateKey = "YOUR_PRIVATE_KEY";
   ```

3. **Deploy Smart Contract**
   - The contract ABI is located in `assets/Vaccination.json`
   - Deploy the smart contract to your Ethereum network
   - Update the contract address in the code if necessary

### 2. Mobile Permissions

For Android, ensure the following permissions are configured in `android/app/src/main/AndroidManifest.xml`:
- Internet access
- Storage access (for wallet management)

## 🏃 Running the Application

### Run on Android/iOS Emulator
```bash
flutter run
```

### Run on Web
```bash
flutter run -d chrome
```

### Run on Physical Device
```bash
# Connect your device via USB and enable USB debugging
flutter devices  # List available devices
flutter run -d <device-id>
```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web
```

## 📁 Project Structure

```
vaccine--certificate/
├── android/                 # Android-specific files
├── ios/                    # iOS-specific files
├── web/                    # Web-specific files
├── lib/
│   ├── api/
│   │   └── contract_linking.dart   # Blockchain integration
│   ├── pages/
│   │   ├── newWallet.dart         # Wallet creation page
│   │   ├── registration.dart       # User registration
│   │   ├── stats.dart             # Statistics dashboard
│   │   ├── vaccinationStatus.dart # Vaccination status view
│   │   └── walletSetup.dart       # Wallet setup page
│   └── main.dart                   # Application entry point
├── assets/
│   └── Vaccination.json           # Smart contract ABI
├── test/                          # Test files
├── pubspec.yaml                   # Dependencies configuration
└── README.md
```

## 📱 Usage

### 1. Home Screen
The main screen provides navigation to:
- **Vaccination Status**: Check vaccination records
- **Registration**: Register new users
- **Stats**: View vaccination statistics
- **Wallet Setup**: Create or import Ethereum wallet

### 2. Wallet Setup
- Create a new wallet or import an existing one
- Securely stores wallet credentials locally
- Required for blockchain interactions

### 3. Vaccination Status
- View approved vaccines
- Check vaccination counts
- Interact with smart contract to fetch real-time data

### 4. Registration
- Register new users in the system
- Link Ethereum address with user profile

### 5. Statistics
- View overall vaccination statistics
- Track approved vaccines
- Monitor vaccination progress

## 🔗 Smart Contract Integration

The application interacts with an Ethereum smart contract for:
- **Storing vaccination records** on the blockchain
- **Retrieving vaccination status** in a tamper-proof manner
- **Managing approved vaccines** list
- **Tracking vaccination schedules**

Key contract functions:
- `getApprovedVaccinesLength()` - Get total approved vaccines
- `approveVaccine()` - Approve a new vaccine
- `getRequiredVaccineCount()` - Get required vaccine count

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter best practices
- Write meaningful commit messages
- Add comments for complex logic
- Test on multiple platforms before submitting PR

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

**Gaurav**
- GitHub: [@Itsmegaurav47](https://github.com/Itsmegaurav47)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Ethereum and web3dart communities
- All contributors who help improve this project

---

**Note**: This is a development version. For production use, ensure proper security measures, use mainnet or appropriate test networks, and never expose private keys in the source code.
