import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/chat_service.dart';
import '../models/message_model.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authService = AuthService();
  final _chatService = ChatService();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage(String text) async {
    final user = _authService.currentUser;
    if (user == null) return;

    final message = MessageModel(
      id: '',
      text: text,
      senderName: user.displayName ?? '',
      senderEmail: user.email ?? '',
      timestamp: DateTime.now(),
    );

    await _chatService.sendMessage(message);
    _scrollToBottom();
  }

  Future<void> _logout() async {
    await _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = _authService.currentUser?.email ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 28,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Color(0xFF94A3B8)),
            onPressed: _logout,
            tooltip: 'Sair',
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFE2E8F0)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: _chatService.getMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF20C975)),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar mensagens.'));
                }

                final messages = snapshot.data ?? [];

                if (messages.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhuma mensagem ainda.\nSeja o primeiro a escrever! 👋',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 15),
                    ),
                  );
                }

                _scrollToBottom();

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.senderEmail == currentUserEmail;
                    return MessageBubble(message: message, isMe: isMe);
                  },
                );
              },
            ),
          ),
          MessageInput(onSend: _sendMessage),
        ],
      ),
    );
  }
}