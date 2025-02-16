import 'package:flutter/material.dart';

var bannerItems = ["Fish Amok", "Chicken", "Khmer Curry", "Khmer noodle"];
var bannerImages = [
  "images/amok.jpg",
  "images/chicken_steam.jpg",
  "images/curry.jpg",
  "images/norm_pjok.jpg",
];

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // viewportFraction is showing the width of the image. 0.8 means showing 80% of the image width
    PageController controller =
        PageController(viewportFraction: 0.9, initialPage: 1);
    List<Widget> banners = [];

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  bannerImages[x],
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin:  Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black87, Colors.transparent],
                    ),
                  ),
                  ),
              Padding(padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bannerItems[x],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text("More than 40% off", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      height: 350,
      child: PageView(
        controller: controller,
        children: banners,
      ),
    );
  }
}
