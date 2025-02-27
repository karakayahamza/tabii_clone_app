class MediaItem {
  final String name;
  final String type;
  final String summary;
  final String imageUrl;
  final List<String> keywords;
  final String episodeCount;
  final String seasonCount;

  MediaItem({
    required this.name,
    required this.type,
    required this.summary,
    required this.imageUrl,
    required this.keywords,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory MediaItem.fromFirestore(Map<String, dynamic> doc) {
    return MediaItem(
      name: doc['name'] ?? '',
      type: doc['type'] ?? '',
      summary: doc['summary'] ?? '',
      imageUrl: doc['imageUrl'] ?? '',
      keywords: List<String>.from(doc['keywords'] ?? []),
      episodeCount: doc['episodeCount'] ?? 0,
      seasonCount: doc['seasonCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'summary': summary,
      'imageUrl': imageUrl,
      'keywords': keywords,
      'episodeCount': episodeCount,
      'seasonCount': seasonCount,
    };
  }
}