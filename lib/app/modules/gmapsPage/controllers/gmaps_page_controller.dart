import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/entities/herai_point.dart';
import 'package:herai/app/data/entities/pickup_request.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/response/base_response.dart';
import 'package:herai/app/resource/constants_gmaps.dart';
import 'package:herai/app/utils/converter.dart';
import 'package:herai/app/utils/log.dart';
import 'package:location/location.dart';

import '../../../data/repositories/direction_repository.dart';
import '../../../routes/app_pages.dart';

class GmapsPageController extends GetxController {
  DirectionRepository _directionRepository = DirectionRepository();
  RxString pickUpLocation = 'gmaps_diluar_jangkauan'.obs;
  RxString herAiLocation = 'gmaps_tidak_tersedia'.obs;

  Rx<LatLng> originLocation = LatLng(-6.3077878, 106.6981741).obs;
  Rx<LatLng> destinationLocation = LatLng(-6.3032166, 106.683861).obs;

  Rx<HerAiPoint> nearestPoint = HerAiPoint.empty().obs;
  RxList<HerAiPoint> allPoints = <HerAiPoint>[].obs;

  RxBool isloading = true.obs;

  LocationData? currentLocation;

  Marker? originMarker;
  Marker? destinationMarker;

  RxList polylineCoordinates = <LatLng>[].obs; //List<LatLng>

  Set<Polyline> polyLine = {};

  List<int> itemIds = Get.arguments == null ? [] : Get.arguments["item_ids"];

  HerAiApi _api = HerAiApi();

  // GoogleMapController googleMapController;
  late BitmapDescriptor markerbitmap;

  @override
  void onInit() async {
    try {
      Log.colorGreen('getLocation');

      await getLocation();
    } catch (e) {
      Log.colorGreen('getLocation : ERROR');
      Log.colorGreen(e);
    }
    // var direction = await _directionRepository.getDirection(
    //     origin: originLocation.value, destination: destinationLocation.value);
    // if (direction != null && direction.status == 'OK') {
    //   pickUpLocation.value = direction.routes.first.legs.first.startAddress;
    //   herAiLocation.value = direction.routes.first.legs.first.endAddress;
    // }
    getPolyPoints(destinationLocation.value);

    isloading.value = false;

    // if (direction != null) {
    //   _setPolyline(
    //     PolylinePoints()
    //         .decodePolyline(direction.routes.first.overviewPolyline.points),
    //   );
    // }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // Future<LocationGudang> getUserData() async {
  //   final response = await _api.get(AuthEndpoints.getUserData);

  //   user.value =
  //       baseResponseFromMap<User>(response, (p0) => User.fromMap(p0)).data;
  //   return user.value;
  // }

  Future<void> getLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    Log.colorGreen('Permission ${_permissionGranted}');

    var currentLocation = await location.getLocation();
    Log.colorGreen("TEST - ${currentLocation}");
    var latLng = latLngFromLocationData(currentLocation);
    allPoints.value = await _directionRepository.getHerAiPoints();

    Log.colorGreen("TEST - ${latLng}");
    var nearest =
        await _directionRepository.getNearestHerAiPoint(latLng, allPoints);
    originLocation.value = latLng;
    nearestPoint.value = nearest;
    destinationLocation.value = LatLng(nearest.latitude, nearest.longitude);

    isloading.value = false;
  }

  Future<void> getPolyPoints(LatLng destination) async {
    Log.colorGreen(
        'destination : ${destination.latitude}, ${destination.longitude}');
    isloading.value = false;
    var direction = await _directionRepository.getDirection(
      origin: originLocation.value,
      destination: destination,
    );

    if (direction != null && direction.status == 'OK') {
      pickUpLocation.value = direction.routes.first.legs.first.startAddress;
      herAiLocation.value = direction.routes.first.legs.first.endAddress;
    }
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(
          originLocation.value.latitude,
          originLocation.value.longitude,
        ),
        PointLatLng(
          destination.latitude,
          destination.longitude,
        ),
        travelMode: TravelMode.driving);

    print('result_getroute : ${result.status}');
    polylineCoordinates.clear();
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
    }
    print('polycoordinate polycoordinate : ${polylineCoordinates}');
  }

  void addMarker(LatLng pos) {
    if (originMarker == null ||
        (originMarker != null && destinationMarker != null)) {
      originMarker = Marker(
        markerId: MarkerId('Origin'),
        position: pos,
      );
      destinationMarker = null;
    } else {
      //origin is already set
      //set destination
      destinationMarker = Marker(
        markerId: MarkerId('Destination'),
        position: pos,
      );
    }
  }

  void pickUpAction() async {
    var origin = originLocation.value;
    var coordinates = '${origin.latitude},${origin.longitude}';
    var request = PickupRequest(
        pointId: nearestPoint.value.id.toString(),
        note: "-",
        locationName: "-",
        address: pickUpLocation.value,
        coordinate: coordinates,
        items: itemIds);
    var response = await _api.post(Urls.postNewPickUpRequest, request.toMap());
    var success = baseResponseFromMap(response, (p0) => p0.toString());
    Get.offNamed(Routes.FINISH_PAGE, arguments: {"message": success.message});
  }
}
