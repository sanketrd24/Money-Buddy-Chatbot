# Money Buddy - Development Instructions

## Quick Setup Checklist

- [x] Project scaffolding complete
- [x] Core chatbot service implemented
- [x] UI components created
- [x] Theme and styling configured
- [x] Web support configured
- [ ] Run flutter pub get
- [ ] Test on web platform
- [ ] Test on mobile (optional)

## Prerequisites

- **Flutter SDK**: 3.0.0 or higher
- **Dart**: 3.0.0 or higher
- **Node.js**: For web deployment (optional)

## Initial Setup

1. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

2. **Check Flutter installation**
   ```bash
   flutter doctor
   ```

3. **Enable web support** (if not already enabled)
   ```bash
   flutter config --enable-web
   ```

## Running the Application

### Run on Web
```bash
flutter run -d chrome
```

### Run on Android
```bash
flutter run -d android
```

### Run on iOS (macOS only)
```bash
flutter run -d ios
```

## Project Architecture

### Layers

1. **Models** (`lib/models/`)
   - `chat_models.dart`: Data classes for messages, quizzes, myths, etc.

2. **Services** (`lib/services/`)
   - `chatbot_service.dart`: Core chatbot logic and message processing
   - `finance_data.dart`: All financial content (concepts, quizzes, myths)

3. **UI** (`lib/screens/` & `lib/widgets/`)
   - `chat_screen.dart`: Main chat interface
   - `chat_widgets.dart`: Reusable UI components

4. **Constants** (`lib/constants/`)
   - `theme.dart`: Colors, typography, theme configuration

## Key Features Implemented

### ✅ Concept Explanations
- Simple, beginner-friendly explanations
- Real-world analogies
- Practical examples
- 6 core investment concepts

### ✅ Quiz Mode
- 5 sample multiple-choice questions
- Instant feedback
- Educational explanations

### ✅ Myth vs Fact
- Debunks 5 common finance myths
- Fact-based explanations
- Beginner-friendly language

### ✅ Story Mode
- Real-life analogies
- Character-based learning
- Engaging narratives

### ✅ Responsive Design
- Mobile-first approach
- Tablet optimization
- Desktop/web support
- Touch-friendly interface

## Customization Guide

### Add a New Financial Concept

1. Open `lib/services/finance_data.dart`
2. Add to the `concepts` list:

```dart
ConceptExplanation(
  id: '7',
  concept: 'Your Concept Name',
  simpleExplanation: 'A simple 1-2 sentence explanation',
  analogy: 'An easy-to-understand analogy',
  example: 'A practical real-world example',
  relatedConcepts: ['concept-1', 'concept-2'],
  emoji: '📊', // Or any relevant emoji
),
```

### Add a New Quiz Question

1. Open `lib/services/finance_data.dart`
2. Add to the `quizQuestions` list:

```dart
QuizQuestion(
  id: 'q6',
  question: 'Your question here?',
  options: [
    'Option A',
    'Option B (Correct)',
    'Option C',
    'Option D',
  ],
  correctAnswerIndex: 1, // Index of correct option
  explanation: 'Why this answer is correct...',
  topic: 'Topic Name',
),
```

### Add a New Myth

1. Open `lib/services/finance_data.dart`
2. Add to the `mythFacts` list:

```dart
MythFact(
  id: 'm6',
  myth: 'Common misconception...',
  fact: 'The actual truth...',
  explanation: 'Why the myth is wrong and fact is right...',
  topic: 'Topic Category',
),
```

### Customize Theme Colors

Edit `lib/constants/theme.dart`:

```dart
class AppColors {
  static const primary = Color(0xFF6366F1);      // Change primary color
  static const secondary = Color(0xFF10B981);    // Change secondary color
  static const accent = Color(0xFFF59E0B);       // Change accent color
  // ... other colors
}
```

## Building for Production

### Web Build
```bash
flutter build web --release
```

### Android APK Build
```bash
flutter build apk --release
```

### iOS Build
```bash
flutter build ios --release
```

## Testing

### Run Tests
```bash
flutter test
```

### Hot Reload During Development
```bash
flutter run
# Press 'r' to hot reload
# Press 'R' to hot restart
```

## Deployment

### Firebase Hosting (Web)
```bash
flutter build web
firebase deploy
```

### Google Play Store (Android)
- Build signed APK: `flutter build apk --release --split-per-abi`
- Upload to Google Play Console

### Apple App Store (iOS)
- Build and sign: `flutter build ios --release`
- Upload using Xcode or Transporter

## Troubleshooting

### Flutter not found
```bash
export PATH="$PATH:/path/to/flutter/bin"
```

### Web not enabled
```bash
flutter config --enable-web
```

### Build cache issues
```bash
flutter clean
flutter pub get
```

### Dependency conflicts
```bash
flutter pub outdated
flutter pub upgrade
```

## Development Best Practices

1. **Hot Reload**: Use 'r' for quick iteration
2. **Format Code**: `flutter format .`
3. **Analyze Code**: `flutter analyze`
4. **Test Responsiveness**: Use Chrome DevTools
5. **Test on Device**: Always test on real device before release

## File Structure

```
lib/
├── main.dart
├── models/
│   └── chat_models.dart
├── services/
│   ├── chatbot_service.dart
│   └── finance_data.dart
├── screens/
│   └── chat_screen.dart
├── widgets/
│   └── chat_widgets.dart
├── constants/
│   └── theme.dart
└── utils/
```

## Performance Tips

- Keep messages list reasonable (implement pagination if needed)
- Use `const` constructors where possible
- Lazy load content
- Optimize image assets
- Use efficient list building

## Next Steps

1. ✅ Run `flutter pub get`
2. ✅ Run `flutter run -d chrome` (or your target platform)
3. ✅ Test the chatbot interface
4. 📝 Add more concepts and questions
5. 🎨 Customize colors and branding
6. 📱 Test on mobile devices
7. 🚀 Deploy to web/app stores

---

For more details, see `README.md`.
