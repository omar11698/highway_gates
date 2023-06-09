import 'package:flutter/material.dart';

class GoogleFacebookCard extends StatelessWidget {

  final String icon,cardName;
  final VoidCallback?  onTap;
  const GoogleFacebookCard({
  super.key, required this.icon, required this.cardName,required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
      var deviceWidth=MediaQuery.of(context).size.width;
    return Expanded(
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(height: 20,child: CircleAvatar(backgroundColor:Colors.white,child: Image.asset(icon,),)),
                ),
                const SizedBox(width: 5,),
                Text(cardName,style:  TextStyle(color: Colors.black,fontSize: deviceWidth>768? 18 :12,fontWeight: FontWeight.w500,),),
              ],
            ),
          ),
        ));
  }
}
