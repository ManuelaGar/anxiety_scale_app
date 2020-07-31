import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.title, @required this.onPress});

  final Color color;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen =
        MediaQuery.of(context).copyWith().size.width > 600 ? true : false;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: isLargeScreen ? 60.0 : 42.0,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: isLargeScreen ? 15.0 : 17.0),
          ),
        ),
      ),
    );
  }
}
