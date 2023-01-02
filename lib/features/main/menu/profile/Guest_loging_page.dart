// ignore_for_file: unnecessary_const

import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/gradient_text.dart';
import 'package:dhakalive/widgets/video_item.dart';
import 'package:flutter/material.dart';

class GuestProfilePage extends StatelessWidget {
  GuestProfilePage({Key? key}) : super(key: key);

  var title = [
    "Terms of Servies",
    "Subscription",
    "FAQ",
    "Contact",
    "Setting",
    "Languages",
    "Logout"
  ];
  bool isGuestUser = true;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/dliveicon.png",
          fit: BoxFit.contain,
        ),
        leadingWidth: 35,
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: (() {}), icon: const Icon(Icons.notifications_active))
        ],
      ),
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
                      left: 140,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(56, 208, 193, 147),
                        radius: 20,
                      ),
                    ),
                    const Positioned(
                      bottom: -25,
                      right: 170,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(56, 208, 193, 147),
                        radius: 20,
                      ),
                    ),
                    const Positioned(
                      top: -25,
                      right: 40,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(56, 208, 193, 147),
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
                      children: [
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              child: Text("Guest"),
                              radius: 35,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 2,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "Guest User",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            isGuestUser == false
                                ? Card(
                                    color: HexColor("#D9C58D"),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          right: 18,
                                          left: 18),
                                      child: const Text(
                                        "Premium",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 200,
                                    child: const Center(
                                      child: GradientText(
                                        "Please Login For more services",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
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
                                  onPressed: () {},
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
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 270,
                width: double.infinity,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            text: "Watchlist",
                          ),
                          Tab(
                            text: "Watch History",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            isGuestUser == false
                                ? Container(
                                    height: h * 30,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            VideoItem(
                                              width: 280,
                                              title:
                                                  "Golden jubilee Concert Live",
                                            ),
                                        itemCount: 5),
                                  )
                                : const Center(
                                    child: GradientText(
                                      "Please Login for Adding Watchlist ",
                                    ),
                                  ),
                            isGuestUser == false
                                ? const Icon(Icons.watch, size: 30)
                                : const Center(
                                    child: const GradientText(
                                      "Please Login for see Watchlist ",
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                  children: List.generate(
                isGuestUser == false ? 7 : 6,
                (index) => ListTile(
                    onTap: () {
                      if (index == 0) {
                        print(index);
                      }
                      if (index == 1) {
                        print(index);
                      }
                      if (index == 4) {
                        print(index);
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
