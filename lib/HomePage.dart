import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:transformer_page_view/index_controller.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slideIndex = 0;
  final List<String> images =[
    'images/slide_1.png',
    'images/slide_2.png',
    'images/slide_3.png',
    'images/slide_4.png'
  ];
  final List<String>text0 = [
    "Welcome onboard the app",
    "Enjoy the app",
    "Show your abilities",
    "Friends are great"
  ];
  final List<String>text1 = [
    "App for food lovers, satisfy your taste",
    "Find best meals in your area, simply",
    "Have fun while eating your relatives and more",
    "Meet new friends from all over the world"
  ];
  final IndexController controller = IndexController();
  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
      pageSnapping: true,
      onPageChanged: (index){
        setState(() {
          this.slideIndex = index;
        });
      },
      loop: false,
      controller: controller,
      transformer: PageTransformerBuilder(
        builder: (Widget child, TransformInfo info){
          return new Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ParallaxContainer(
                    child: Text(
                      text0[info.index],
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 34.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold
                      )
                    ),
                    position: info.position,
                    opacityFactor: 0.8,
                    translationFactor: 400.0,
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  ParallaxContainer(
                    child: Image.asset(
                      images[info.index],
                      fit: BoxFit.contain,
                      height: 350.0,
                    ),
                    position: info.position,
                    translationFactor: 400.0,
                  ),
                  SizedBox(
                    height:45.0,
                  ),

                  ParallaxContainer(
                    child: Text(
                      text1[info.index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    position: info.position,
                    translationFactor: 300.0,
                  ),
                  SizedBox(
                    height: 55.0,
                  ),
                ],
              ),
            )
          );
        }),
      itemCount: 4);
    return Scaffold(
    backgroundColor: Colors.white,
    body: transformerPageView,
    );
  }
}
