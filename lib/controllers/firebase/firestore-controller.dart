import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mainor_chat_2023/controllers/persistence-controller.dart';
import 'package:mainor_chat_2023/models/chat-message.dart';


class FirestoreController extends PersistenceController {
  late FirebaseFirestore db;

  Future<void> init() async {
    db = FirebaseFirestore.instance;
    /*await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );*/
  }

  @override
  Future<List<ChatMessage>> getAllMessages() async {
    await init();
    var snapshot = await db.collection("messages").get();
    return snapshot.docs.map((m) => ChatMessage.fromJson(m.data())).toList();
  }

  @override
  Future<void> saveMessage(ChatMessage message) async {
    await init();
    await db.collection("messages").add(message.toJson());
  }
  
}