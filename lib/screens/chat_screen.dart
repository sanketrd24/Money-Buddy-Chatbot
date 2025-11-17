import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../models/chat_models.dart';
import '../services/chatbot_service.dart';
import '../widgets/chat_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatbotService _chatbotService;
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _chatbotService = ChatbotService();
    _initializeChat();
  }

  void _initializeChat() {
    _chatbotService.getWelcomeMessage();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    if (_inputController.text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      await _chatbotService.processUserInput(_inputController.text);
      _inputController.clear();
      _scrollToBottom();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _handleQuickReply(String text) async {
    _inputController.text = text;
    await _sendMessage();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              '💰 Money Buddy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _chatbotService.resetSession();
              _initializeChat();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _chatbotService.messages.isEmpty
                ? const EmptyState(
                    emoji: '💰',
                    title: 'Welcome to Money Buddy!',
                    subtitle: 'Ask me anything about investing and finance.',
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 8 : 16,
                    ),
                    itemCount: _chatbotService.messages.length,
                    itemBuilder: (context, index) {
                      final message = _chatbotService.messages[index];
                      return Column(
                        children: [
                          ChatBubble(message: message),
                          if (message.options != null &&
                              message.options!.isNotEmpty &&
                              message.isBot)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 12 : 20,
                                vertical: 8,
                              ),
                              child: Wrap(
                                spacing: 4,
                                children: message.options!
                                    .map(
                                      (option) => QuickReplyButton(
                                        label: option,
                                        onTap: () => _handleQuickReply(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                  strokeWidth: 2,
                ),
              ),
            ),
          InputField(
            controller: _inputController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
