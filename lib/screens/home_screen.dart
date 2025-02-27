import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../service/FirebaseService.dart';
import '../model/media_item.dart';

final List<String> channels = [
  'Aksiyon',
  'Tarih',
  'Dram',
  'Komedi',
  'Suç',
  'Romantik',
  'Spor',
  'Animasyon',
  'Seyahat',
  'Aile',
];

final Map<String, String> channelImages = {
  'Aksiyon': 'assets/images/image6.png',
  'Tarih': 'assets/images/image5.png',
  'Dram': 'assets/images/image3.png',
  'Komedi': 'assets/images/image4.png',
  'Suç': 'assets/images/image2.png',
  'Romantik': 'assets/images/image.png',
  'Spor': 'assets/images/image7.png',
  'Animasyon': 'assets/images/image8.png',
  'Seyahat': 'assets/images/cirak.png',
  'Aile': 'assets/images/Gassal.png',
  'İnsan Hikayeleri': 'assets/images/example.png',
};
final List<String> broadcastImages = [
  'assets/images/trt/TRT 1.png',
  'assets/images/trt/TRT 2.png',
  'assets/images/trt/TRT 3.png',
  'assets/images/trt/TRT 4.png',
  'assets/images/trt/TRT 5.png',
  'assets/images/trt/TRT 6.png',
  'assets/images/trt/TRT 7.png',
  'assets/images/trt/TRT 8.png',
  'assets/images/trt/TRT 9.png',
  'assets/images/trt/TRT 10.png',
  'assets/images/trt/TRT 11.png',
  'assets/images/trt/TRT 12.png',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGenre = 'Aksiyon';
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final FirebaseService _firebaseService = FirebaseService();
  List<MediaItem> mediaList = [];
  List<MediaItem> filmList = [];


  @override
  void initState() {
    super.initState();
    _loadMediaItems();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  Future<void> _loadMediaItems() async {
    try {
      List<MediaItem> items = await _firebaseService.fetchMediaItems();
      setState(() {
        mediaList = items.where((item) => item.type == "Dizi").toList();
        filmList = items.where((item) => item.type == "Film").toList();
      });
      print('Dizi öğeleri: ${mediaList.length}, Film öğeleri: ${filmList.length}');
    } catch (e) {
      print('Veri çekme hatası: $e');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onGenreSelected(String genre) {
    setState(() {
      selectedGenre = genre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 700,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      MediaItem media = mediaList[index];
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/${media.imageUrl}.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 16,
                            right: 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          media.keywords[0],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "•",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          media.keywords[1],
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: 0.7,
                                            ),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "•",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          media.keywords[2],
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: 0.7,
                                            ),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Oynat",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      mediaList.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: _currentPage == index ? 12 : 8,
                        height: _currentPage == index ? 12 : 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color:
                              _currentPage == index
                                  ? Color(0xFF00FF99)
                                  : Colors.grey.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Haftanın Öne Çıkanları',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            MediaItem media = filmList[index];
                            return Container(
                              width: 140,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/movies/${media.imageUrl}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      buildLiveBroadcasts('Canlı Yayınlar'),
                      const SizedBox(height: 24),
                      buildContentTypes('Türler', channels),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 4,
                        right: 4,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.black.withValues(alpha: 0.8),
                            Colors.black.withValues(alpha: 0.6),
                            Colors.black.withValues(alpha: 0.3),
                            Colors.black.withValues(alpha: 0.0),
                          ],
                          stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/tabii-seeklogo.svg",
                                      height: 32,
                                      width: 32,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1.0,
                                ),
                                child: Row(
                                  children: [
                                    _GenreText(
                                      label: 'Tümü',
                                      isSelected: selectedGenre == 'Tümü',
                                      onTap: () => _onGenreSelected('Tümü'),
                                    ),
                                    _GenreText(
                                      label: 'Aksiyon',
                                      isSelected: selectedGenre == 'Aksiyon',
                                      onTap: () => _onGenreSelected('Aksiyon'),
                                    ),
                                    _GenreText(
                                      label: 'Komedi',
                                      isSelected: selectedGenre == 'Komedi',
                                      onTap: () => _onGenreSelected('Komedi'),
                                    ),
                                    _GenreText(
                                      label: 'Drama',
                                      isSelected: selectedGenre == 'Drama',
                                      onTap: () => _onGenreSelected('Drama'),
                                    ),
                                    _GenreText(
                                      label: 'Bilim Kurgu',
                                      isSelected:
                                          selectedGenre == 'Bilim Kurgu',
                                      onTap:
                                          () => _onGenreSelected('Bilim Kurgu'),
                                    ),
                                    _GenreText(
                                      label: 'Macera',
                                      isSelected: selectedGenre == 'Macera',
                                      onTap: () => _onGenreSelected('Macera'),
                                    ),
                                    _GenreText(
                                      label: 'Romantik',
                                      isSelected: selectedGenre == 'Romantik',
                                      onTap: () => _onGenreSelected('Romantik'),
                                    ),
                                    _GenreText(
                                      label: 'Korku',
                                      isSelected: selectedGenre == 'Korku',
                                      onTap: () => _onGenreSelected('Korku'),
                                    ),
                                    _GenreText(
                                      label: 'Animasyon',
                                      isSelected: selectedGenre == 'Animasyon',
                                      onTap:
                                          () => _onGenreSelected('Animasyon'),
                                    ),
                                    _GenreText(
                                      label: 'Belgesel',
                                      isSelected: selectedGenre == 'Belgesel',
                                      onTap: () => _onGenreSelected('Belgesel'),
                                    ),
                                    _GenreText(
                                      label: 'Fantastik',
                                      isSelected: selectedGenre == 'Fantastik',
                                      onTap:
                                          () => _onGenreSelected('Fantastik'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GenreText extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenreText({
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2.5,
                width: label.length * 8.0,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}

Widget buildContentTypes(String title, List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            String item = items[index];
            return Container(
              width: 140,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        channelImages[item] ?? 'assets/images/example.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget buildLiveBroadcasts(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: broadcastImages.length,
          itemBuilder: (context, index) {
            return Container(
              width: 140,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(broadcastImages[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    ],
  );
}
