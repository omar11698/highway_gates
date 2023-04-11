import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const DefaultButton({
  super.key,
  required this.mobileSize, required this.label, this.onTap,
  });

  final Size mobileSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: mobileSize.height*0.068,
        width: mobileSize.width*0.94,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.blueAccent,Colors.purple],begin: Alignment.topLeft,end: Alignment.bottomRight) ,
          border: Border.all(width: 0, ),
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Text(label,style: const TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
