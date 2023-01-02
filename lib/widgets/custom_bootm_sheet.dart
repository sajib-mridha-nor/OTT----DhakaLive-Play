import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/hexcolor.dart';

Future<void> ratingBootmSheet(BuildContext context, rating, onSubmited) {
  final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Rating",
                style: textTheme.headline4,
              ),
              SizedBox(
                height: 8,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.all(4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  size: 10,
                  color: HexColor("F6E1A6"),
                ),
                onRatingUpdate: rating,
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor)),
                  onPressed: onSubmited,
                  child: Text("Submitted")),
            ],
          ),
        ),
      );
    },
  );
}
