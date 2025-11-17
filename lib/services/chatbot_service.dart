import 'dart:async';
import '../models/chat_models.dart';
import 'finance_data.dart';

class ChatbotService {
  final List<Message> _messages = [];
  late ChatSession _currentSession;

  ChatbotService() {
    _initializeSession();
  }

  void _initializeSession() {
    _currentSession = ChatSession(
      id: DateTime.now().toString(),
      startTime: DateTime.now(),
      messages: _messages,
      currentMode: 'chat',
    );
    getWelcomeMessage();
  }

  List<Message> get messages => _messages;
  ChatSession get currentSession => _currentSession;

  Future<Message> processUserInput(String userInput) async {
    // Add user message
    final userMessage = Message(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      text: userInput,
      isBot: false,
      timestamp: DateTime.now(),
    );
    _messages.add(userMessage);

    // Generate bot response
    final botMessage = await _generateBotResponse(userInput);
    _messages.add(botMessage);

    return botMessage;
  }

  Future<Message> _generateBotResponse(String input) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    final lowerInput = input.toLowerCase();

    // Check for quiz mode
    if (lowerInput.contains('quiz') || lowerInput.contains('question')) {
      return _getQuizMessage();
    }

    // Check for myth vs fact
    if (lowerInput.contains('myth') || lowerInput.contains('fact')) {
      return _getMythFactMessage();
    }

    // Check for story mode
    if (lowerInput.contains('story') || lowerInput.contains('example')) {
      return _getStoryMessage();
    }

    // Default: concept explanation
    return _getConceptExplanation(input);
  }

  Message _getConceptExplanation(String query) {
    ConceptExplanation? concept;

    // Smart concept matching
    for (var c in FinanceData.concepts) {
      if (query.toLowerCase().contains(c.concept.toLowerCase())) {
        concept = c;
        break;
      }
    }

    concept ??= FinanceData.concepts[0];

    final responseText = '''${concept.concept}

${concept.simpleExplanation}

Example: ${concept.example}

Think of it like: ${concept.analogy}

This is for learning only, not financial advice.

What would you like next?
Quiz | Myth vs Fact | Deep Dive | Summary''';

    return Message(
      id: 'bot_${DateTime.now().millisecondsSinceEpoch}',
      text: responseText,
      isBot: true,
      timestamp: DateTime.now(),
      options: ['Quiz', 'Myth vs Fact', 'Deep Dive', 'Summary'],
      type: MessageType.options,
    );
  }

  Message _getQuizMessage() {
    final question = FinanceData.quizQuestions[0];

    final responseText = '''🎯 **Quiz Time!**

${question.question}

A) ${question.options[0]}
B) ${question.options[1]}
C) ${question.options[2]}
D) ${question.options[3]}

Just type A, B, C, or D!''';

    return Message(
      id: 'bot_${DateTime.now().millisecondsSinceEpoch}',
      text: responseText,
      isBot: true,
      timestamp: DateTime.now(),
      options: ['A', 'B', 'C', 'D'],
      type: MessageType.quiz,
    );
  }

  Message _getMythFactMessage() {
    final mythFact = FinanceData.mythFacts[0];

    final responseText = '''Myth vs Fact

Myth: "${mythFact.myth}"

Fact: "${mythFact.fact}"

Why? ${mythFact.explanation}

${FinanceData.disclaimer}''';

    return Message(
      id: 'bot_${DateTime.now().millisecondsSinceEpoch}',
      text: responseText,
      isBot: true,
      timestamp: DateTime.now(),
      type: MessageType.mythFact,
    );
  }

  Message _getStoryMessage() {
    final responseText = '''Story Time!

Imagine little Raj starts with 100 rupees pocket money.

He decides to invest 50 rupees every month instead of spending it on candy.

After 1 year, thanks to compound interest, his 600 rupees becomes 650 rupees!

After 10 years? His consistent 1200 rupees investment becomes 15,000 rupees!

The magic? Time, consistency, and compound interest!

This is for learning only, not financial advice.''';

    return Message(
      id: 'bot_${DateTime.now().millisecondsSinceEpoch}',
      text: responseText,
      isBot: true,
      timestamp: DateTime.now(),
      type: MessageType.story,
    );
  }

  void resetSession() {
    _messages.clear();
    _initializeSession();
  }

  Message getWelcomeMessage() {
    final welcomeMessage = Message(
      id: 'welcome_${DateTime.now().millisecondsSinceEpoch}',
      text: FinanceData.getWelcomeMessage(),
      isBot: true,
      timestamp: DateTime.now(),
      options: [
        'Learn a concept',
        'Take a quiz',
        'Myth vs Fact',
        'Story mode'
      ],
      type: MessageType.options,
    );
    _messages.add(welcomeMessage);
    return welcomeMessage;
  }
}
