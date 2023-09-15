import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:halen_customer_app/components/appBar/tab_page_appbar.dart';
import 'package:halen_customer_app/screens/homepage/components/custom_appbar.dart';
import 'package:halen_customer_app/screens/messages/models.dart';
import 'package:halen_customer_app/screens/messages/message_chat_page.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesThreadsScreen extends ConsumerWidget {
  const MessagesThreadsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(children: [
        // const TabPageAppBar(name: "Edward"),
        const HomeAppBar(
          key: Key("custom_app_bar"),
          name: 'Edward',
          // location: 'Add Address',
          image: 'assets/images/illustrations/profile_image.png',
          cartItemCount: 0,
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: chatsTestData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message chat = chatsTestData[index];
                  return GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MessageChatPage(
                                user: chat.sender,
                              ),
                            ),
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.w, color: Colors.black45))),
                        height: 117.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                        child: Center(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(2.h),
                              decoration: chat.unread
                                  ? BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(999)),
                                      // border: Border.all(
                                      //   width: 2,
                                      //   color: AppColors.primaryColor1,
                                      // ),
                                      // shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primaryColor1
                                              .withOpacity(0.5),
                                          spreadRadius: 1.w,
                                          blurRadius: 2.w,
                                        ),
                                      ],
                                    )
                                  : BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[200]!
                                              .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.black45,
                                child: Image.asset(chat.sender.imageUrl),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    chat.sender.name,
                                                    style: TextStyle(
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  chat.sender.isOnline
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5.w),
                                                          width: 7.w,
                                                          height: 7.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                        )
                                                      : Container(
                                                          child: null,
                                                        ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Text(
                                                chat.time,
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              chat.text,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      )
                                    ])
                                  ]),
                            ),
                          ],
                        )),
                      ));
                }))
      ]),
    ));
  }
}
