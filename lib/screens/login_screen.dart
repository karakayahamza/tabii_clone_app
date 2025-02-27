import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _moviePosters = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];
  final List<String> _buttonTexts = [
    "Hedefine hemen başla!",
    "Hayalini gerçeğe dönüştür!",
    "İlk adımını at!",
  ];

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });

      if (_user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    });

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      setState(() {
        _user = userCredential.user;
      });
    } catch (e) {
      print("Error during sign-in: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 60;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: SizedBox(
          height: 100,
          width: 100,
          child: SvgPicture.asset(
            'assets/tabii-seeklogo.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: screenHeight,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      Image.asset('assets/images/image.png', fit: BoxFit.cover),
                      Image.asset('assets/images/image2.png', fit: BoxFit.cover),
                      Image.asset('assets/images/image3.png', fit: BoxFit.cover),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _buttonTexts[_currentPage],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 4),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _moviePosters.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                            width: _currentPage == index ? 6 : 6,
                            height: _currentPage == index ? 6 : 6,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: _currentPage == index
                                  ? Color(0xFF00FF99)
                                  : Colors.grey.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _signInWithGoogle,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00FF99),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          textStyle: TextStyle(fontSize: 16),
                          minimumSize: Size(double.infinity, 50),
                        ).copyWith(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Text("Şimdi Üye Ol", style: TextStyle(color: Colors.black)),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: _signInWithGoogle,
                        child: Text("Bir hesabın var mı? Giriş yap"),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          textStyle: TextStyle(fontSize: 16),
                          minimumSize: Size(double.infinity, 50),
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
    );
  }
}