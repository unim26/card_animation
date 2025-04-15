# 💳 Credit Card Flip Animation - Flutter

A beautiful Flutter UI that demonstrates a **3D animated credit card flip** when the CVV input field is focused or unfocused. This mimics the real-world interaction where users see the back of the card while entering CVV.

## ✨ Features

- Smooth 3D flip animation using `AnimationController`
- Front and back credit card views
- Responsive layout
- Real-time data binding for card number and cardholder name
- Auto-flip to back when focusing on CVV
- Flip back to front when CVV field loses focus

## 🖼 Preview

| Front View | Flip Animation | Back View |
|------------|----------------|-----------|
| ![front](preview/front.png) | ![flip](preview/flip.gif) | ![back](preview/back.png) |

## 🛠 Technologies Used

- Flutter
- Dart
- AnimationController
- Transform with Matrix4 for 3D effect

## 📁 Folder Structure

```bash
lib/
├── main.dart
├── home_page.dart
└── widgets/
    ├── card_front_view.dart
    └── card_back_view.dart
