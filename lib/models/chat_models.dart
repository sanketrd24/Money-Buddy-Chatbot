class Message {
  final String id;
  final String text;
  final bool isBot;
  final DateTime timestamp;
  final List<String>? options;
  final MessageType type;

  Message({
    required this.id,
    required this.text,
    required this.isBot,
    required this.timestamp,
    this.options,
    this.type = MessageType.text,
  });

  @override
  String toString() => 'Message(id: $id, text: $text, isBot: $isBot)';
}

enum MessageType { text, quiz, mythFact, story, options }

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String topic;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.topic,
  });
}

class MythFact {
  final String id;
  final String myth;
  final String fact;
  final String explanation;
  final String topic;

  MythFact({
    required this.id,
    required this.myth,
    required this.fact,
    required this.explanation,
    required this.topic,
  });
}

class ConceptExplanation {
  final String id;
  final String concept;
  final String simpleExplanation;
  final String analogy;
  final String example;
  final List<String> relatedConcepts;
  final String emoji;

  ConceptExplanation({
    required this.id,
    required this.concept,
    required this.simpleExplanation,
    required this.analogy,
    required this.example,
    required this.relatedConcepts,
    required this.emoji,
  });
}

class ChatSession {
  final String id;
  final DateTime startTime;
  final List<Message> messages;
  final String currentMode; // 'chat', 'quiz', 'myth-fact', 'story'
  int quizScore = 0;
  int totalQuestions = 0;

  ChatSession({
    required this.id,
    required this.startTime,
    required this.messages,
    required this.currentMode,
  });
}
