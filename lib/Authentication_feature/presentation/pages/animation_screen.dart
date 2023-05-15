import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highway_gates/Core/constants/svg_images.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../Core/router/navigation_router.dart';
import 'package:firebase_storage/firebase_storage.dart';


class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin {
   AnimationController? animationController;
   Animation<Size>? animatedPosition;
   Animation? animatedPosition2;

  @override
  void initState() {
    super.initState();
    // final storage = FirebaseStorage.instance;


    Future.delayed(
        const Duration(seconds: 5),

            () => Navigator.pushNamed(context, onBoardingRoute)
    );
    animationController=AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    );
    animationController?.forward();

  }
@override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }


  @override

  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    animatedPosition=Tween<Size>(
      //size.height*0.33, size.width*0.31,
        begin:  const Size(0,0), end: Size( size.width*0.31,size.height*0.33),).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.bounceIn,
      ),
    );
    animatedPosition2=Tween(begin:0.0 ,end: 2*pi ).animate(animationController!);

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: animatedPosition!,
        builder: (BuildContext context, Widget? child) { return Stack(
          children: [
            ///logo
            Positioned(
              top: animatedPosition?.value.height,
              left: animatedPosition?.value.width,
              child: Transform.rotate(
                angle:animatedPosition2?.value,
                child: SizedBox(
                  height: size.height*0.23,
                  width: size.width*0.38,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SvgPicture.asset(
                      logoSvgImg,
                    ),
                  ),
                ),
              ),
            ),
            ///Back ground
            Positioned(
              bottom: 20,
              left: 10,
              child: SizedBox(
                height: size.height *0.65,
                width: size.width*0.97,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SvgPicture.asset(
                    splashSvgImg,
                  ),
                ),
              ),
            ),
          ],
        ); },
      ),
    );
  }
}
