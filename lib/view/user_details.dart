import 'package:etech_demo/view/screen_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/userviewmodel/user_entity.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
        appBarText: "User Details", child: DetailsView(user: user));
  }
}

class DetailsView extends StatelessWidget {
  final User user;

  const DetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: ListView(
          children: [
            Image.network(
              user.avatarUrl,
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                GetText(text: "Name : ${user.login}"),
                GetText(text: "Id : ${user.id}"),
                GetText(text: "Subscriptions Url : ${user.subscriptionsUrl}"),
                GetText(text: "Organizations Url : ${user.organizationsUrl}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GetText extends StatelessWidget {
  final String text;

  const GetText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          border: Border.all(color: Colors.white),
          color: Colors.white10),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20.sp),
      ),
    );
  }
}
