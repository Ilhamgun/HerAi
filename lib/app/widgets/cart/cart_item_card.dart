import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/network/response/cart_response.dart';
import 'package:herai/app/modules/homeV2/controllers/home_v2_controller.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';
import 'package:herai/app/utils/log.dart';

class CardCart extends StatelessWidget {
  CardCart({
    Key? key,
    required this.id,
    required this.item,
  }) : super(key: key);

  String id;
  CartItem item;

  @override
  Widget build(BuildContext context) {
    HomeV2Controller baseController = Get.find<HomeV2Controller>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 14),
      // color: Colors.blue,
      child: Row(
        children: [
          Checkbox(
            value: item.selected,
            side: BorderSide(color: ColorsCustom.primaryColor.green),
            onChanged: (value) {
              item.selected = value!;
              Log.colorGreen('value : ${item.toMap}');

              baseController.items.refresh();
              baseController.countTotal();
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorsCustom.primaryColor.midOrange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      item.picture.isEmpty
                          ? CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/bottles.png'),
                              // backgroundColor: Color(0xffD9D9D9),
                              minRadius: 20,
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(item.picture),
                              // backgroundColor: Color(0xffD9D9D9),
                              minRadius: 20,
                            ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: Get.width * .4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyleHeading.textH7XXSmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    '${item.weight} Kg',
                                    style: TextStyleHeading.textH8SuperSmall
                                        .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    'HP ${item.price}',
                                    style: TextStyleHeading.textH8SuperSmall
                                        .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () => showAlertDialog(context, item),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.delete_outline,
                size: 32,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context, CartItem item) {
  HomeV2Controller baseController = Get.find<HomeV2Controller>();
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: Text("Batal"),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text("Hapus"),
    onPressed: () {
      baseController.deleteCart(item);
      Get.back();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hapus"),
    content: Text("Hapus item ini?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
