# Unit Converter Desktop Application

Modern bir desktop uygulaması - Flutter & Dart ile geliştirilmiştir.

## 🎯 Proje Özellikleri

- **Multi-Screen Navigation** - GoRouter ile 3 ekran
- **State Management** - Provider + ChangeNotifier
- **Local Database** - Drift ile conversion history
- **API Integration** - Dio ile currency exchange API
- **Repository Pattern** - Clean architecture
- **Dependency Injection** - get_it
- **Form Validation** - TextFormField validators
- **Dark/Light Theme** - ThemeProvider ile tema desteği
- **Desktop Compatible** - Windows, macOS, Linux

## 🚀 Build Instructions

### 1. Dependencies Yükleme
```bash
flutter pub get
```

### 2. Drift Database Dosyalarını Oluşturma
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Uygulamayı Çalıştırma

#### Android Emulator
```bash
flutter run -d emulator-5554
```

#### Windows Desktop
```bash
flutter run -d windows
```

#### macOS Desktop
```bash
flutter run -d macos
```

#### Linux Desktop
```bash
flutter run -d linux
```

## 📁 Proje Yapısı

```
lib/
├── models/          # Data models
├── views/           # UI screens (Home, History, Settings)
├── providers/       # State management (Provider pattern)
├── repositories/    # Data layer (Repository pattern)
├── services/        # Business logic & API services
├── db/              # Drift database
├── widgets/         # Reusable UI components
├── router/          # GoRouter configuration
└── di/              # Dependency injection (get_it)
```

## 🔧 API Configuration

Uygulama ücretsiz currency exchange API kullanmaktadır. Ek API key yapılandırması gerekmemektedir.

## 📱 Özellikler

### Ana Ekran (Home)
- Unit conversion (Length, Weight, Temperature, Currency)
- Form validation
- Real-time conversion
- History'ye kaydetme

### Geçmiş (History)
- Drift database ile kayıtlı conversions
- StreamBuilder ile reactive UI
- Silme işlemi

### Ayarlar (Settings)
- Dark/Light theme switching
- SharedPreferences ile tema kaydı

## 🎓 Geliştirici

**Kurs:** Flutter & Dart Desktop Application Development  
**Platform:** Windows, macOS, Linux  
**Framework:** Flutter 3.10+

## 📄 License

Bu proje eğitim amaçlı geliştirilmiştir.
