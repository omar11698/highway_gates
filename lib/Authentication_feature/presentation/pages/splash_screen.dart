import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Core/constants/svg_images.dart';
import '../../../Core/router/navigation_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Future.delayed(
        const Duration(seconds:3),
            () => Navigator.pushNamed(context, animationRoute)
    );
  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ///logo
          Positioned(
            top: size.height/3,
            left:size.width/3,
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
      ),
    );
  }
}
