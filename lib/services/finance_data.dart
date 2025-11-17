import '../models/chat_models.dart';

class FinanceData {
  static const String disclaimer =
      'This is for learning only, not financial advice. 📚';

  static final List<ConceptExplanation> concepts = [
    ConceptExplanation(
      id: '1',
      concept: 'SIP (Systematic Investment Plan)',
      simpleExplanation:
          'SIP is like putting the same amount of money into a savings jar every month, instead of all at once.',
      analogy:
          'Imagine saving for a video game. Instead of saving 1000 rupees all at once, you save 100 rupees every month for 10 months. Thats SIP!',
      example:
          'You invest 500 rupees every month in a mutual fund. After 1 year, youve invested 6000 rupees and possibly earned extra returns.',
      relatedConcepts: ['mutual-fund', 'compound-interest', 'investment-risk'],
      emoji: '📊',
    ),
    ConceptExplanation(
      id: '2',
      concept: 'Mutual Fund',
      simpleExplanation:
          'A mutual fund is like a group of people pooling their money to buy different stocks together.',
      analogy:
          'Imagine 100 kids combining their pocket money to buy 10 different toys. Everyone gets a share of each toy!',
      example:
          'You invest 1000 rupees in a mutual fund. Your money mixes with others money to buy stocks from different companies.',
      relatedConcepts: ['sip', 'diversification', 'portfolio'],
      emoji: '💰',
    ),
    ConceptExplanation(
      id: '3',
      concept: 'Compound Interest',
      simpleExplanation:
          'Compound interest is when your money earns interest, and then THAT interest earns more interest. Magic money growth!',
      analogy:
          'You plant a seed. It grows into a tree. The tree makes seeds. Those seeds grow into more trees. That\'s compound interest!',
      example:
          'You invest 1000 rupees at 10% interest. Year 1: 1100 rupees. Year 2: 1210 rupees (interest on 1100, not just 1000).',
      relatedConcepts: ['investment-return', 'time-value', 'sip'],
      emoji: '🚀',
    ),
    ConceptExplanation(
      id: '4',
      concept: 'Diversification',
      simpleExplanation:
          'Don\'t put all your eggs in one basket! Spread your money across different investments to reduce risk.',
      analogy:
          'If you only like one type of snack and the shop runs out, you have nothing. But if you like chips, candy, and fruit, you\'re always okay!',
      example:
          'Instead of buying only one stock, you invest in stocks, bonds, and gold. If stocks fall, other investments might stay stable.',
      relatedConcepts: ['risk-management', 'mutual-fund', 'portfolio'],
      emoji: '🎯',
    ),
    ConceptExplanation(
      id: '5',
      concept: 'Stock Market',
      simpleExplanation:
          'The stock market is like a big shop where you can buy tiny pieces of companies and become a part-owner!',
      analogy:
          'Imagine your friend starts a lemonade business. You buy a small part of it (a share). Now you own a tiny piece and get profits!',
      example:
          'You buy 1 share of Apple for $150. Apple grows, and your share becomes worth $200. You just made $50!',
      relatedConcepts: ['stock', 'portfolio', 'trading'],
      emoji: '📈',
    ),
    ConceptExplanation(
      id: '6',
      concept: 'Risk vs Return',
      simpleExplanation:
          'Higher returns usually come with higher risk. Safe investments give small returns. Risky ones might give big returns... or big losses!',
      analogy:
          'A safe slide at the playground vs. a tall roller coaster. Slide = safe but boring. Roller coaster = fun but scary!',
      example:
          'Savings account (safe, 4% return). Stocks (risky, could be 15% or -10%). Choose based on how brave you are!',
      relatedConcepts: ['investment-risk', 'portfolio-balance', 'diversification'],
      emoji: 'balance',
    ),
  ];

  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      id: 'q1',
      question: 'What does SIP stand for?',
      options: [
        'Systematic Investment Plan',
        'Simple Interest Payment',
        'Savings Insurance Program',
        'Stock Investment Portfolio'
      ],
      correctAnswerIndex: 0,
      explanation:
          'SIP stands for Systematic Investment Plan. It\'s when you invest a fixed amount regularly (like monthly).',
      topic: 'SIP',
    ),
    QuizQuestion(
      id: 'q2',
      question: 'Which of these is an advantage of mutual funds?',
      options: [
        'Guaranteed returns',
        'Professional management and diversification',
        'No risk at all',
        'Free money'
      ],
      correctAnswerIndex: 1,
      explanation:
          'Mutual funds are managed by professionals and offer instant diversification because you invest in multiple stocks.',
      topic: 'Mutual Fund',
    ),
    QuizQuestion(
      id: 'q3',
      question: 'What is compound interest?',
      options: [
        'Interest paid twice a year',
        'Interest earned on interest',
        'Interest that\'s complicated',
        'A bank service'
      ],
      correctAnswerIndex: 1,
      explanation:
          'Compound interest is when you earn interest on your original money AND on the interest you already earned. It grows exponentially!',
      topic: 'Compound Interest',
    ),
    QuizQuestion(
      id: 'q4',
      question: 'Why is diversification important?',
      options: [
        'To make more money',
        'To spread risk across different investments',
        'To buy more things',
        'It\'s not important'
      ],
      correctAnswerIndex: 1,
      explanation:
          'Diversification helps reduce risk. If one investment fails, others can compensate.',
      topic: 'Diversification',
    ),
    QuizQuestion(
      id: 'q5',
      question: 'Which investment typically has higher returns but higher risk?',
      options: ['Savings account', 'Fixed deposit', 'Stocks', 'Gold'],
      correctAnswerIndex: 2,
      explanation:
          'Stocks have the potential for high returns but come with higher risk compared to savings accounts or fixed deposits.',
      topic: 'Risk vs Return',
    ),
  ];

  static final List<MythFact> mythFacts = [
    MythFact(
      id: 'm1',
      myth: 'You need lots of money to start investing.',
      fact:
          'You can start investing with as little as 100-500 rupees per month through SIP!',
      explanation:
          'Many mutual funds and brokers allow small investments. SIP makes it easy to start small and grow gradually.',
      topic: 'Investment Basics',
    ),
    MythFact(
      id: 'm2',
      myth: 'Stock market is just for rich people.',
      fact: 'Anyone can invest in the stock market with a small amount of money.',
      explanation:
          'With digital platforms, you can open an account in minutes and invest from any amount you\'re comfortable with.',
      topic: 'Stock Market',
    ),
    MythFact(
      id: 'm3',
      myth: 'Investing is the same as gambling.',
      fact:
          'Investing is based on research and long-term planning; gambling is based on luck and quick bets.',
      explanation:
          'Investors analyze companies, diversify, and think long-term. Gamblers rely on chance and short-term wins.',
      topic: 'Investment Basics',
    ),
    MythFact(
      id: 'm4',
      myth: 'Higher returns always mean higher risk.',
      fact:
          'Risk and return are related, but smart diversification can increase returns while managing risk.',
      explanation:
          'A well-balanced portfolio of stocks, bonds, and gold can offer decent returns with moderate risk.',
      topic: 'Risk Management',
    ),
    MythFact(
      id: 'm5',
      myth: 'You should check your investments every day.',
      fact:
          'Long-term investors should check their investments quarterly or annually, not daily.',
      explanation:
          'Daily checking can make you panic-sell during market dips. Long-term investing requires patience and discipline.',
      topic: 'Investment Strategy',
    ),
  ];

  static String getWelcomeMessage() {
    return '''👋 Hey! I'm Money Buddy! 🤑

I'm here to make finance super fun and easy to understand. Whether you want to learn about SIP, mutual funds, or just have fun with trivia, I've got you!

What would you like to do?
📚 Learn a concept
⭐ Take a quiz
🧩 See myth vs fact
📖 Story mode
📝 Get a quick summary''';
  }

  static String getResponsePrompt(String concept) {
    final conceptData = concepts.firstWhere(
      (c) => c.concept.toLowerCase().contains(concept.toLowerCase()),
      orElse: () => concepts.first,
    );
    return conceptData.simpleExplanation;
  }
}
