import 'package:flutter/material.dart';
import 'package:herai/app/resource/colors_data.dart';

import '../../data/entities/user.dart';

class AvatarProfileNameEmail extends StatelessWidget {
  const AvatarProfileNameEmail({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        color: ColorsCustom.primaryColor.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          user.profilePicture.isEmpty
              ? CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/blank_profile.png'),
                  backgroundColor: Color(0xffD9D9D9),
                  minRadius: 24,
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicture),
                  backgroundColor: Color(0xffD9D9D9),
                  minRadius: 24,
                ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${user.email}',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
