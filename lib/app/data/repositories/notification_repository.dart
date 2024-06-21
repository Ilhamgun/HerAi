import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/entities/notif_data.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/response/base_list_response.dart';

class NotificationRepository {
  late HerAiApi _api;

  NotificationRepository() {
    _api = HerAiApi();
  }

  Future<List<Notification>> getNotifications() async {
    final response = await _api.get(Urls.notification);
    return baseListResponseFromMap<Notification>(
        response, (p0) => Notification.fromMap(p0)).data;
  }

  Future<List<Notification>> readNotification(String notificationId) async {
    final response =
        await _api.put(Urls.notification + "${notificationId}", null);
    return baseListResponseFromMap<Notification>(
        response, (p0) => Notification.fromMap(p0)).data;
  }
}
