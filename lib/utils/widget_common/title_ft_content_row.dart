import 'package:flutter/material.dart';

class TitleFtContentRow extends StatelessWidget {
  const TitleFtContentRow({
    Key? key,
    required this.titleValue,
    required this.content,
    required this.onPress,
  }) : super(key: key);
  final String titleValue;
  final Widget content;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(titleValue),
          content,
          InkWell(
            onTap: onPress,
            child: Icon(
              Icons.arrow_forward_ios,
            ),
          )
        ],
      ),
    );
  }
}
