import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/router/navigation_router.dart';
import 'onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex=0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, loginRoute);
              },
              child: const Text(
                "تخطي",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
            controller: _pageController,
            itemCount: onboardingList.length,
            onPageChanged: (int index){
              setState(() {
                currentIndex=index;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    /// logo
                    SizedBox(height:MediaQuery.of(context).size.height*0.35, child: SvgPicture.asset(onboardingList[index].image)),
                    const SizedBox(height: 10,),
                    /// title
                    Text(onboardingList[index].title,style: const TextStyle(fontSize:35,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    /// body text
                    Text(onboardingList[index].desc,style: const TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                    /// row of the next pages circles
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,children: [
                        Row(children: [
                          SizedBox(
                            height: 10,
                            child: ListView.builder(shrinkWrap:true,scrollDirection: Axis.horizontal,itemCount: onboardingList.length,itemBuilder: (context, index) {
                              return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                Container(
                                  margin:const EdgeInsets.symmetric(horizontal: 8),
                                  width:8,
                                  height:8,
                                  decoration:  BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: currentIndex>=index?Colors.black:Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),

                              ],);
                            }),
                          ),
                        ],),
                        GestureDetector(
                          onTap: (){
                            if (index == onboardingList.length - 1) {
                              /// last screen in the onBoarding
                              Navigator.pushReplacementNamed(context, loginRoute);
                            }
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 2000),
                              curve: Curves.easeOutBack,
                              // curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin:const EdgeInsets.symmetric(horizontal: 8),
                            width:40,
                            height:40,
                            decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                          ),
                        ),


                      ],
                      ),
                    ),

                  ],
                ),
              );
            }),
      ),
    );
  }
}