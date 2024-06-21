import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/routes/app_pages.dart';
import 'package:herai/app/utils/log.dart';

class HomeBaseMenu extends StatelessWidget {
  HomeBaseMenu({Key? key}) : super(key: key);
  HomeV2Controller baseController = Get.find<HomeV2Controller>();

  @override
  Widget build(BuildContext context) {
    Log.colorGreen('BASE_CONTROLLER : ${baseController.user.value.name}');
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      baseController.isLoading.isTrue
                          ? Container(
                              width: 35,
                              height: 35,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: ColorsCustom.primaryColor.midOrange,
                              ),
                            )
                          : baseController.user.value.profilePicture.isEmpty
                              ? GestureDetector(
                                  onTap: () async {
                                    var result = await Get.toNamed(
                                        Routes.PROFILE_PAGE,
                                        arguments: {
                                          'user': baseController.user.value
                                        });
                                    Log.colorGreen('RESULT_VALUE : ${result}');
                                    if (result != null)
                                      baseController.user.value = result;
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/blank_profile.png'),
                                    backgroundColor: Color(0xffD9D9D9),
                                    minRadius: 24,
                                  ),
                                )
                              : Obx(() => GestureDetector(
                                    onTap: () => Get.toNamed(
                                        Routes.PROFILE_PAGE,
                                        arguments: {
                                          'user': baseController.user.value
                                        }),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          baseController
                                              .user.value.profilePicture),
                                      backgroundColor: Color(0xffD9D9D9),
                                      minRadius: 24,
                                    ),
                                  )),
                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => baseController.gotoNotif(),
                            icon: Icon(
                              Icons.notifications_active_rounded,
                              color: ColorsCustom.primaryColor.green,
                              size: 24,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => baseController
                                .gotoSettings(), //authbaseController.logout(),
                            icon: Icon(
                              Icons.settings,
                              color: ColorsCustom.primaryColor.green,
                              size: 24,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(
                      'home_hallo'.trParams(
                          {'name': '${baseController.user.value.name}'}),
                      style: TextStyle(fontSize: 14),
                    )),
                Text(
                  'home_selamat_datang!'.tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          //Card Green
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 24),
            width: Get.width,
            decoration: BoxDecoration(
              color: ColorsCustom.primaryColor.green,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Color(0xff000000).withOpacity(.24),
                    offset: Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('HerAi Coins',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    )),
                SizedBox(height: 10),
                Text(
                  'HC ${baseController.user.value.point}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                //Circle Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _circleButton(
                        icon: Icons.history,
                        label: 'Riwayat',
                        onTap: () => baseController.gotoHistoryTransaction()),
                    _circleButton(
                        icon: Icons.change_circle,
                        label: 'Tukar Poin',
                        onTap: () => null)
                  ],
                ),
                SizedBox(height: 16),
                Obx(() => _cardMenugguSelesai()),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              'Kemajuan Kamu',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 16),
          Obx(() => IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(width: 24),
                    _cardDataReport(
                        title:
                            '${baseController.user.value.overview.progress.trashThisMonth} Kg',
                        subTitle: 'Sampah yang kamu daur ulang / Bulan ini'),
                    SizedBox(width: 16),
                    _cardDataReport(
                        title:
                            '${baseController.user.value.overview.progress.topWeightOnTransaction} Kg',
                        subTitle:
                            'Rekor daur ulang sampah terbanyak dalam satu transaksi'),
                    SizedBox(width: 24),
                  ],
                ),
              )),
          SizedBox(height: 24),
          Obx(() => IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(width: 24),
                    _cardDataReport(
                        title:
                            '${baseController.user.value.overview.progress.totalTransaction}',
                        subTitle: 'Transaksi daur ulang sampah'),
                    SizedBox(width: 16),
                    _cardDataReport(
                        title:
                            '${baseController.user.value.overview.progress.totalWeight} Kg',
                        subTitle: 'Total transaksi daur ulang kamu'),
                    SizedBox(width: 24),
                  ],
                ),
              )),

          SizedBox(
            height: 30,
          ),
          // MainFeatureCard(
          //   title: 'home_pilah_sampah'.tr,
          //   subTitle:
          //       'home_pilah_sampah_yang_dapat_didaur_ulang_menggunakan_kamera'
          //           .tr,
          //   icon: Icons.camera_alt,
          //   onTap: () => Get.dialog(
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         ButtonCardLogo(
          //           image: 'assets/images/imagePick.png',
          //           onTap: () {
          //             Get.back();
          //             baseController.pickImage(ImageSource.gallery);
          //           },
          //         ),
          //         SizedBox(
          //           width: 50,
          //         ),
          //         ButtonCardLogo(
          //           image: 'assets/images/cameraPick.png',
          //           onTap: () {
          //             Get.back();
          //             baseController.pickImage(ImageSource.camera);
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // MainFeatureCard(
          //     title: 'home_riwayat_transaksi'.tr,
          //     subTitle: 'home_ketahui_transaksi_yang_telah_dilakukan'.tr,
          //     icon: Icons.my_library_books_rounded,
          //     onTap: () => baseController.gotoHistoryTransaction()),
        ],
      ),
    );
  }

  Widget _cardDataReport({required String title, required String subTitle}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        height: 115,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorsCustom.primaryColor.green)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: ColorsCustom.primaryColor.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardMenugguSelesai() {
    var transaactionWaiting =
        baseController.user.value.overview.transaction.waiting;
    var totalTransaction = baseController.user.value.overview.transaction.total;
    return Container(
      padding: EdgeInsets.all(20),
      width: Get.width - 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorsCustom.primaryColor.green)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Get.width * .35),
                child: Text(
                  '$transaactionWaiting',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Menunggu'),
            ],
          ),
          Container(
            width: 2,
            height: 50,
            color: ColorsCustom.darkGrey30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Get.width * .35),
                child: Text(
                  '$totalTransaction',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(height: 10),
              Text('Selesai'.tr),
            ],
          ),
        ],
      ),
    );
  }

  Column _circleButton(
      {required String label,
      required IconData icon,
      required Function() onTap}) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
                onPressed: () => onTap(),
                icon: Icon(
                  icon,
                  color: ColorsCustom.primaryColor.green,
                ))),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
