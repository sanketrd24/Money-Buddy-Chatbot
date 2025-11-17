import 'package:flutter/material.dart';
import 'constants/theme.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const MoneyBuddyApp());
}

class MoneyBuddyApp extends StatelessWidget {
  const MoneyBuddyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Buddy - Financial Learning Chatbot',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
