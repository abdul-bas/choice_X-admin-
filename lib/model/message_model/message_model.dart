import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageId;
  final String chatId;
  final String senderId;
  final String receiverId;
  final String? text;
  final String? imageUrl;
  final String? productId;
  final String? productName;
  final int? variantIndex;
  final DateTime createdAt;
  MessageModel({
    required this.messageId,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    this.text,
    this.imageUrl,
    this.productId,
    this.productName,
    this.variantIndex,
    required this.createdAt,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'chatId': chatId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'imageUrl': imageUrl,
      'productId': productId,
      'productName': productName,
      'variantIndex': variantIndex,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map['messageId'] ?? '',
      chatId: map['chatId'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      text: map['text'],
      imageUrl: map['imageUrl'],
      productId: map['productId'],
      productName: map['productName'],
      variantIndex: map['variantIndex'],
      createdAt:
          (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
