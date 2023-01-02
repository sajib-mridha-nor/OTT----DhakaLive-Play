import 'package:dhakalive/features/auth/auth_controller.dart';
import 'package:dhakalive/features/auth/registration/login_page.dart';

import 'package:dhakalive/features/main/menu/profile/profile_controller.dart';
import 'package:dhakalive/utils/hexcolor.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../content/playlist/playlist_content_page.dart';
import '../../../content/series/series_content_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final profileController = Get.put(ProifileController());

  var title = [
    "Terms of Servies",
    "Subscription",
    "FAQ",
    "Contact",
    "Setting",
    "Languages",
    "Logout"
  ];

  final authController = Get.find<AuthController>();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    profileController.profile();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: HexColor("#2A2A2A"),
                child: Stack(
                  children: [
                    const Positioned(
                      top: -25,
                      right: 40,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(56, 208, 193, 147),
                        radius: 25,
                      ),
                    ),
                    const Positioned(
                      bottom: -25,
                      right: 80,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(70, 203, 191, 155),
                        radius: 25,
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      right: 120,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(57, 195, 181, 132),
                        radius: 15,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Container(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(4.0),
                        //     child: CircleAvatar(
                        //       radius: 40,
                        //       backgroundImage: NetworkImage(controller
                        //                   .fbUserData["img"] ==
                        //               null
                        //           ? "https://images.unsplash.com/photo-1655072073264-966327476378?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                        //           : controller.fbUserData["img"].toString()),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                box.read("name").toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Card(
                              color: HexColor("#D9C58D"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, right: 18, left: 18),
                                child: Text(
                                  "Premium",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.to(LoginPage());
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: HexColor("#FFCDBD"),
                                  )),
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor("#FFCDBD"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 270,
              //   width: double.infinity,
              //   child: DefaultTabController(
              //     length: 2,
              //     child: Column(
              //       children: [
              //         const TabBar(
              //           tabs: [
              //             Tab(
              //               text: "Watchlist",
              //             ),
              //             Tab(
              //               text: "Watch History",
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           height: 5,
              //         ),
              //         Expanded(
              //           child: TabBarView(
              //             children: [
              //               Container(
              //                 height: h * 30,
              //                 child: ListView.builder(
              //                     scrollDirection: Axis.horizontal,
              //                     shrinkWrap: true,
              //                     itemBuilder: (context, index) => VideoItem(
              //                           width: 280,
              //                           title: "Golden jubilee Concert Live",
              //                         ),
              //                     itemCount: 5),
              //               ),
              //               GestureDetector(
              //                 onTap: () {
              //                   Get.to(() => GuestProfilePage());
              //                 },
              //                 child: const Center(
              //                     child: GradientText(
              //                         "For Add Watch_list Please login")),
              //               ),
              //               // Icon(Icons.directions_car, size: 350),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Column(
                  children: List.generate(
                7,
                (index) => ListTile(
                    onTap: () {
                      if (index == 0) {
                        // box.read("jwt");

                        print(box.read("jwt"));
                        // print(index);
                      }
                      if (index == 1) {
                        Get.to(PlaylistContentPage());
                        print(index);
                      }
                      if (index == 2) {
                        Get.to(SeriesContentPage(), arguments: 12);
                        print(index);
                      }
                      if (index == 6) {
                        authController.allLogout();
                      }
                    },
                    leading: Text(title[index]),
                    trailing: const Icon(Icons.arrow_forward_ios)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
