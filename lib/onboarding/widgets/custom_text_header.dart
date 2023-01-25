import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomTextHeader(
      {Key? key, required this.tabController, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontWeight: FontWeight.normal,
          ),
    );
  }
}
