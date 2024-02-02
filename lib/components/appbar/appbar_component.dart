import 'package:flutter/material.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget{
  const AppbarComponent({super.key,this.title, this.onPressed, this.icon, this.icon2, this.onPressed2});

  final String? title;
  final void Function()? onPressed;
  final IconData? icon;
  final void Function()? onPressed2;
  final IconData? icon2;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressed2, 
          icon: Icon(
            icon2,
            color: Colors.white
          )
        ),
        IconButton(
          onPressed: onPressed, 
          icon: Icon(
            icon,
            color: Colors.white,
          )
        )
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}