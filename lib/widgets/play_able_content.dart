import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/utils/palette.dart';
import 'package:dhakalive/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class PlayAbleContent extends StatelessWidget {
  final String? title;
  final String? category;
  final String? duration;

  final VoidCallback? onReshare;
  final VoidCallback? onCast;
  final VoidCallback? onMore;
  final VoidCallback? onThumbleClick;
  final String? ratting;
  final String? thumbleImg;

  PlayAbleContent(
      {Key? key,
      this.onThumbleClick,
      this.onCast,
      this.thumbleImg,
      this.category,
      this.duration,
      this.onReshare,
      this.ratting,
      this.onMore,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor("#2A2A2A"), borderRadius: BorderRadius.circular(15)),
      height: 308,
      // color: Colors.amber,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: InkWell(
            onTap: onThumbleClick,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Stack(
                children: [
                  Image.asset(
                    thumbleImg ?? "assets/drama.png",
                    fit: BoxFit.cover,
                    height: 230,
                    width: double.infinity,
                  ),
                  Positioned(
                      top: 15,
                      right: 15,
                      // left: 20,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: HexColor("#FF8B68"),
                                ),
                                Text(
                                  ratting ?? " 6.5",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                          ))),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    left: 15,
                    child: Container(
                      width: 400,
                      child: Row(
                      
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Palette.detailsClr,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),


                              Text(
                                ratting ?? "23:56" "  Min",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Palette.detailsClr,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: onCast,
                                  icon: const Icon(
                                    Icons.cast,
                                    size: 24,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: onReshare,
                                child: Image.asset(
                                  "assets/reshare.png",
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              IconButton(
                                onPressed: onMore,
                                icon: const Icon(
                                  Icons.more_vert,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
              ),
              Text(
                title ?? "Breakup with Febu",
                style: TextStyle(color: HexColor("#EDE0DD"), fontSize: 20),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/dliveicon.png",
                        height: 27,
                        width: 27,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "DhakaLive",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.verified,
                        size: 12,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        category ?? "Short Film", //
                        style: const TextStyle(
                            color: Palette.detailsClr, fontSize: 13),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        ratting ?? "12" '+', //
                        style:
                            TextStyle(color: HexColor("#E7BDB2"), fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
