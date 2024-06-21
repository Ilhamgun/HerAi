import 'package:get/get.dart';

import '../modules/FAQPage/bindings/f_a_q_page_binding.dart';
import '../modules/FAQPage/views/f_a_q_page_view.dart';
import '../modules/ImageResultPage/bindings/image_result_page_binding.dart';
import '../modules/ImageResultPage/views/image_result_page_view.dart';
import '../modules/PilihSampah/bindings/pilih_sampah_binding.dart';
import '../modules/PilihSampah/views/pilih_sampah_view.dart';
import '../modules/cartPage/bindings/cart_page_binding.dart';
import '../modules/cartPage/views/cart_page_view.dart';
import '../modules/contactus/bindings/contactus_binding.dart';
import '../modules/contactus/views/contactus_view.dart';
import '../modules/finishPage/bindings/finish_page_binding.dart';
import '../modules/finishPage/views/finish_page_view.dart';
import '../modules/gmapsPage/bindings/gmaps_page_binding.dart';
import '../modules/gmapsPage/views/gmaps_page_view.dart';
import '../modules/historyTransactionPage/bindings/history_transaction_page_binding.dart';
import '../modules/historyTransactionPage/views/history_transaction_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeV2/bindings/home_v2_binding.dart';
import '../modules/homeV2/views/home_v2_view.dart';
import '../modules/loginPage/bindings/login_page_binding.dart';
import '../modules/loginPage/views/login_page_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboardingPage/bindings/onboarding_page_binding.dart';
import '../modules/onboardingPage/views/onboarding_page_view.dart';
import '../modules/profilePage/bindings/profile_page_binding.dart';
import '../modules/profilePage/views/profile_page_view.dart';
import '../modules/registerPage/bindings/register_page_binding.dart';
import '../modules/registerPage/views/register_page_view.dart';
import '../modules/settingsPage/bindings/settings_page_binding.dart';
import '../modules/settingsPage/views/settings_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_PAGE,
      page: () => SettingsPageView(),
      binding: SettingsPageBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_TRANSACTION_PAGE,
      page: () => HistoryTransactionPageView(),
      binding: HistoryTransactionPageBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_RESULT_PAGE,
      page: () => ImageResultPageView(),
      binding: ImageResultPageBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => CartPageView(),
      binding: CartPageBinding(),
    ),
    GetPage(
      name: _Paths.GMAPS_PAGE,
      page: () => GmapsPageView(),
      binding: GmapsPageBinding(),
    ),
    GetPage(
      name: _Paths.FINISH_PAGE,
      page: () => FinishPageView(),
      binding: FinishPageBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_PAGE,
      page: () => OnboardingPageView(),
      binding: OnboardingPageBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTUS,
      page: () => ContactusView(),
      binding: ContactusBinding(),
    ),
    GetPage(
      name: _Paths.F_A_Q_PAGE,
      page: () => FAQPageView(),
      binding: FAQPageBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_SAMPAH,
      page: () => PilihSampahView(),
      binding: PilihSampahBinding(),
    ),
    GetPage(
      name: _Paths.HOME_V2,
      page: () => HomeV2View(),
      binding: HomeV2Binding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
