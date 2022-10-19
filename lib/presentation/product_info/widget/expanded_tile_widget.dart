import 'package:flutter/material.dart';

class ExpandedTileWidget extends StatelessWidget {
  const ExpandedTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: SingleChildScrollView(
              child: Text(subTitle),
            ),
          )
        ],
      ),
    );
  }
}
