class MessageModel {
  final String id;
  final String text;
  final String senderName;
  final String senderEmail;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.text,
    required this.senderName,
    required this.senderEmail,
    required this.timestamp,
  });

  factory MessageModel.fromMap(String id, Map<dynamic, dynamic> map) {
    return MessageModel(
      id: id,
      text: map['text'] ?? '',
      senderName: map['senderName'] ?? '',
      senderEmail: map['senderEmail'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderName': senderName,
      'senderEmail': senderEmail,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }
}