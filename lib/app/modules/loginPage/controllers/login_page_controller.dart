import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/data/data_source/shared_pref_secure_storage.dart';
import 'package:herai/app/data/entities/user.dart';
import 'package:herai/app/data/network/request/googleSign.dart';
import 'package:herai/app/data/network/request/login_request.dart';
import 'package:herai/app/data/repositories/auth_repository.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/log.dart';
import 'package:herai/app/utils/extensions.dart';
// import 'package:url_launcher/url_launcher.dart';

class LoginPageController extends GetxController {
  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController passwordTextController = TextEditingController();

  // final Uri _url = Uri.parse('https://accounts.google.com/signup');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<bool> autoValidate = false.obs;
  Rx<bool> visibilityPassword = false.obs;
  String? _token;
  UserProfile _user = UserProfile.empty();

  AuthRepository authRepository = Get.find<AuthRepository>();

  String? token() => _token;
  late String fcmToken = "";

  @override
  void onInit() async {
    _token = await SharedPrefSecureStorage.getInstance()?.getToken();

    try {
      if (_token != "") _user = await authRepository.getUserData();

      if (_user.name.isNotEmpty) {
        Get.offNamed(Routes.HOME_V2, arguments: {'user': _user});
      }
    } on Exception catch (e) {
      Get.errorSnackBar("Error", "Token Expired");
    }

    fcmToken = await authRepository.getFCMToken();
    print(fcmToken);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // emailTextController.text = "ipat@her.ai";
    // passwordTextController.text = "password";
  }

  @override
  void onClose() {
    emailTextController.clear();
    passwordTextController.clear();
    // emailTextController.dispose();
    // passwordTextController.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  Future<void> launchInBrowser() async {
    Get.offNamed(Routes.REGISTER_PAGE);
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    var request =
        LoginRequest(email: email, password: password, deviceToken: fcmToken);
    try {
      _user = await authRepository.loginEmail(request) ?? UserProfile.empty();
      if (_user.name.isNotEmpty)
        Get.offNamed(Routes.HOME_V2, arguments: {'user': _user});
    } on Exception {
      Get.snackbar(
        'Login Failed',
        'Please check email and password',
        maxWidth: 250,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(.5),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

  Future<void> googleSignIn() async {
    String token = await Get.find<AuthController>().googleLogin();
    Log.colorGreen('googleAuth token : ${token}}');
    // var request = await googleAuthLoginFromMap("{'token':$token}");
    try {
      _user = await authRepository.googleLogin(
              GoogleAuthLogin(token: token, deviceToken: fcmToken)) ??
          UserProfile.empty();
      if (_user.name.isNotEmpty)
        Get.offNamed(Routes.HOME_V2, arguments: {'user': _user});
    } on Exception {
      Get.snackbar(
        'Error',
        'Login Failed',
        maxWidth: 250,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(.5),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

  Future<bool> willPop(BuildContext context) async {
    FocusScope.of(context).unfocus();
    return true;
  }
}
