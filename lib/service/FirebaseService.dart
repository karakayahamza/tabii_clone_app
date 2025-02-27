import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/media_item.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addMediaItem(MediaItem item) async {
    try {
      await _db.collection('media').add(item.toMap());
      print('Media item başarıyla eklendi: ${item.name}');
    } catch (e) {
      print('Veri eklenirken hata oluştu: $e');
    }
  }

  Future<List<MediaItem>> fetchMediaItems() async {
    try {
      QuerySnapshot snapshot = await _db.collection('media').get();
      return snapshot.docs.map((doc) {
        return MediaItem.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Firestore’dan veri çekme hatası: $e');
      return [];
    }
  }
}

