
import 'package:highway_gates/Core/constants/svg_images.dart';

class OnBoardModel {
  String image;
  String title;
  String desc;
  OnBoardModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

List<OnBoardModel> onboardingList = <OnBoardModel>[
  OnBoardModel(
    image: logoSvgImg,
    title: "رحلة آمنة",
    desc: "يتم اختيار السائقين مع كفاءة عالية لنعدك برحلة آمنة.",
  ),
  OnBoardModel(
    image: logoSvgImg,
    title: "بيانات مشفرة",
    desc: "يتم تشفير بياناتك لنضمن أنك محمي من أي تهكير.",
  ),
  OnBoardModel(
    image: logoSvgImg,
    title: "الدفع بكل سهولة",
    desc: "وفرنا لك أكثر من طريقة دفع عن طريق الدفع كاش , اونلاين , أو محافظ إلكترونية.",
  ),
];
