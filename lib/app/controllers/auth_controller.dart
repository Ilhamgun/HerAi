import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/log.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/response/get_user_profile.dart';
import '../data/data_source/shared_pref_secure_storage.dart';

class AuthController extends GetxController {
  // GoogleSignInAccount? googleUser;
  String authToken = '';
  RxString languange = 'id'.obs;
  UserCredential? myUser;
  Rx<Profile> profile = Profile.empty().obs;

  Rx<bool> isLoading = false.obs;

  late FirebaseAuth auth;
  final _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  @override
  void onInit() async {
    authToken = await SharedPrefSecureStorage.getInstance()!.getToken();
    auth = FirebaseAuth.instance;
    languange.value =
        await SharedPrefSecureStorage.getInstance()!.getLanguage();


    _googleSignIn.onCurrentUserChanged.listen((event) {
      _user = event;
    });
    _googleSignIn.signInSilently();
    super.onInit();
  }

  Future<String> googleLogin() async {
    Log.colorGreen('googleLogin');

    // final _user = await googleSignIn.signIn();

    try {
      _user = await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }

    if (_user == null) return "";
    _user = _user;

    final googleAuth = await _user!.authentication;
    // Log.colorGreen('googleAuth : ${googleAuth.accessToken}');
    return googleAuth.accessToken ?? "";
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );

    // myUser = await auth.signInWithCredential(credential);
    // profile.value.username = myUser?.user?.displayName ?? '';
    // profile.value.photoURL = myUser?.user?.photoURL ?? '';
    // profile.value.userEmail = myUser?.user?.email ?? '';
    // profile.value.username = myUser?.user?.displayName ?? '';
    // Get.offAllNamed(Routes.HOME);
  }

  void googleLogout() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    await auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await myUser.user!.sendEmailVerification();

      Get.defaultDialog(
        title: "Pendaftaran Berhasil",
        middleText: "Email verifikasi sudah kami kirimkan ke\n$email",
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
            Get.back();
            launchUrl(
              Uri.parse('https://mail.google.com/mail/u/0/#inbox'),
            );
          },
          child: Text(
            "Periksa Email",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Tidak Berhasil',
          'Password terlalu lemah',
          maxWidth: 250,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.5),
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Tidak Berhasil',
          'Email sudah digunakan',
          maxWidth: 250,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.5),
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar(
        'Tidak Berhasil',
        'Tidak dapat mendaftar',
        maxWidth: 250,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(.5),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
      print(e);
    }
  }
}
