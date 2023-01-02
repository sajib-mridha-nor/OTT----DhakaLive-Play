import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  final double? height;
  final double? width;
  const ShimmerImage({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: const BorderRadius.all(const Radius.circular(20)),
          ),

          // height: height ?? 300,
          // width: width ?? 150,
        ),
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!);
  }
}

// class ShimmerCard extends StatelessWidget {
//   final double? height;
//   final double? width;
//   bool isload = false;

//   ShimmerCard({
//     Key? key,
//     this.height,
//     this.width,
//   }) : super(key: key);

//   int bottom = 5;

//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     var h = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Container(
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(const Radius.circular(20)),
//           child: ShimmerImage(
//             height: height,
//             width: width,
//           ),
//         ),
//       ),
//     );
//   }
// }

// Shimmer ImageShimmer() {
//   return Shimmer.fromColors(
//       child: Container(),
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!);
// }
