import 'package:flutter/material.dart';
import 'package:quicksale_super_admin/styles/colors.dart';

class MenuItem extends StatelessWidget {
  Function() tap;
  String title;
  Widget? icon;
  Color? color;
  MenuItem({required this.tap, required this.title, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>tap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 1)
            )
          ]
        ),
        child: Row(
          children: [
            icon!=null?CircleAvatar(
              backgroundColor: color??Karas.secondary,
              child: icon,
              radius: 15,
            ):Container(),
            SizedBox(width: 10,),
            Text(
              title,
              style: TextStyle(color: Karas.primary),
            ),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}
