import 'package:get/get.dart';
import 'package:herai/app/data/entities/notif_data.dart';
import 'package:herai/app/data/repositories/notification_repository.dart';
import 'package:herai/app/utils/log.dart';

class NotificationController extends GetxController {
  NotificationRepository notifRepository = NotificationRepository();
  RxBool isLoading = false.obs;

  RxList<Notification> listNotif = <Notification>[
    Notification(
        id: '1',
        createdAt: DateTime.parse('2022-11-03 21:40:04'),
        data: NotificationData(
            title: 'Transaksi sampah selesai',
            message:
                'Sampahmu telah terjual di pengepul Bank Sampah Kosahii! lihat riwayat transaksi untuk mengeceknya')),
    Notification(
        id: '2',
        createdAt: DateTime.parse('2022-11-02 21:18:04'),
        data: NotificationData(title: 'title 2', message: 'message 2')),
  ].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    listNotif.value = await getListNotification();
    isLoading.value = false;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<Notification>> getListNotification() async {
    List<Notification> data = [];
    try {
      data = await notifRepository.getNotifications();
      return data;
    } catch (e) {
      Log.error('ERROR GET LIST Notif : $e');
    }
    return data;
  }

  Future<void> putRadNotification(String id) async {
    List<Notification> data = [];
    try {
      data = await notifRepository.readNotification(id);
      listNotif.value = data;
    } catch (e) {
      Log.error('ERROR PUT READ Notif : $e');
    }
  }

  String timeNotif(DateTime createdAt) {
    DateTime now = DateTime.now();
    Duration change = now.difference(createdAt);

    String stringDays = '${change.inDays < 1 ? '' : '${change.inDays} hari '}';
    String stringHours =
        '${change.inHours % 24 == 0 ? '' : '${change.inHours % 24} jam '}';
    String stringMinutes =
        '${change.inMinutes % 60 == 0 ? '' : '${change.inMinutes % 60} menit '}';
    String stringSeconds =
        '${change.inSeconds % 60 == 0 ? '' : '${change.inSeconds % 60} detik'}';

    // String duration = stringDays +
    //     stringHours +
    //     stringMinutes +
    //     stringSeconds +
    //     change.toString();
    String duration = stringDays.isNotEmpty
        ? stringDays
        : stringHours.isNotEmpty
            ? stringHours
            : stringMinutes.isNotEmpty
                ? stringMinutes
                : stringSeconds;

    return duration;
  }
}
