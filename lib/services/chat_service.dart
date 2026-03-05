import 'package:firebase_database/firebase_database.dart';
import '../models/message_model.dart';

class ChatService {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref('messages');

  Stream<List<MessageModel>> getMessages() {
    return _messagesRef.orderByChild('timestamp').onValue.map((event) {
      final data = event.snapshot.value;
      if (data == null) return [];

      final Map<dynamic, dynamic> map = data as Map<dynamic, dynamic>;
      final messages = map.entries
          .map((e) => MessageModel.fromMap(e.key, e.value))
          .toList();

      messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      return messages;
    });
  }

  Future<void> sendMessage(MessageModel message) async {
    await _messagesRef.push().set(message.toMap());
  }
}