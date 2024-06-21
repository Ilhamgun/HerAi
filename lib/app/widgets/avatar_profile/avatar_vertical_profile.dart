import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/resource/colors_data.dart';

import '../../data/entities/user.dart';

class AvatarVerticalProfileNameEmail extends StatelessWidget {
  AvatarVerticalProfileNameEmail({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final UserProfile user;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      width: Get.width,
      decoration: BoxDecoration(
        color: ColorsCustom.primaryColor.green,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            textDirection: TextDirection.rtl,
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              user.profilePicture.isEmpty
                  ? CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/blank_profile.png'),
                        backgroundColor: Color(0xffD9D9D9),
                        radius: 55,
                      ),
                    )
                  : CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePicture),
                        backgroundColor: Color(0xffD9D9D9),
                        radius: 55,
                      ),
                    ),
              Positioned(
                bottom: 1,
                left: 68,
                child: GestureDetector(
                  onTap: () => onTap(),
                  child: CircleAvatar(
                    radius: 21,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: ColorsCustom.primaryColor.green,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 12),
            child: Column(
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${user.email}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
