import 'package:flutter/material.dart';

class LiveItemCard extends StatelessWidget {
  final String? subtitle;
  final VoidCallback? onClick;
  final String title;
  final bool? islive;
  var img;
  LiveItemCard(
      {Key? key,
      this.img,
      this.islive,
      this.subtitle,
      this.onClick,
      required this.title})
      : super(key: key);

  int bottom = 5;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    double top = h * .20;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
     
        child: InkWell(
          
          onTap: onClick,
          child: Stack(
           
            fit: StackFit.loose,
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(20)),
                child: img ?? Image.asset("assets/live.png"),
              ),
              Positioned(
                bottom: 10,
                top: subtitle == null ? top : h * .27,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Container(
                          width: 330,
                          child: Text(
                            subtitle ?? "", maxLines: 2, //needed 3  ???
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              islive == true
                  ? Positioned(
                      left: w * .85,
                      right: 10,
                      top: h * .275,
                      bottom: 40,
                      child: const Text(
                        "Live",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14),
                      ))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
