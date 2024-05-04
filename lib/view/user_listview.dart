import 'package:etech_demo/view/screen_base.dart';
import 'package:etech_demo/view/user_details.dart';
import 'package:etech_demo/viewmodel/userviewmodel/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/userviewmodel/user_entity.dart';


class UserLitView extends StatelessWidget {
  const UserLitView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenBase(
        appBarText: "User ListView", child: CustomListView());
  }
}

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 30) {
        BlocProvider.of<UserBloc>(context).add(FetchUsers());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, state) {
        if (state is UserLoaded) {
          return ListView.builder(
              itemCount: state.listUser.length,
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomListTile(user: state.listUser[index]);
              });
        } else if (state is UserError) {
          return const Center(child: Text("Something went wrong"));
        }
        return SizedBox(
            height: 18.h,
            width: 18.w,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UserDetails(user))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.h),
            border: Border.all(color: Colors.white),
            color: Colors.white10),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              user.avatarUrl,
              height: 70.h,
              width: 70.h,
            ),
            SizedBox(
              width: 15.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.login,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Id: ${user.id}",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Type: ${user.type}",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
