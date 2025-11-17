# Assets - Data

This folder contains JSON data files for the Money Buddy app.

## Files

### financial_content.json
Contains all financial education content:
- **Concepts** - 6 investment concepts (SIP, Mutual Funds, Compound Interest, Diversification, Stock Market, Risk vs Return)
- **Quizzes** - 5 quiz questions with metadata
- **Myths** - 5 common finance myths

### app_guide.json
Contains user guide and configuration:
- **Sections** - 5 guide sections for users
- **Tips** - Helpful tips for learning
- **Colors** - Theme color configuration

## Usage in Code

```dart
import 'package:flutter/services.dart';
import 'dart:convert';

// Load data
final jsonString = await rootBundle.loadString('assets/data/financial_content.json');
final data = json.decode(jsonString);

// Access content
final concepts = data['concepts'];
final quizzes = data['quizzes'];
final myths = data['myths'];
```

## Data Structure

All financial content is currently hardcoded in:
- `lib/services/finance_data.dart` - Main financial data

These JSON files serve as reference documentation and future extensibility.
