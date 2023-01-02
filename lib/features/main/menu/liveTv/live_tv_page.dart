import 'package:dhakalive/features/main/menu/liveTv/live_tv_controller.dart';
import 'package:dhakalive/widgets/chennal_card.dart';
import 'package:dhakalive/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LiveTvPage extends StatelessWidget {
  const LiveTvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.block,
            size: 32,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Coming Soon..",
            style: textTheme.headline6?.copyWith(color: Colors.grey),
          )
        ],
      ),
    ));
  }
}
