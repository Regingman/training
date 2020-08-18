import 'package:flutter/material.dart';

class UiTabAnimation extends StatefulWidget {
  UiTabAnimation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UiTabAnimationState createState() => _UiTabAnimationState();
}

class _UiTabAnimationState extends State<UiTabAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: -0.15).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return new Scaffold(
          body: new Center(
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 350.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("Bye"),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          child: Text("Sell"),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                new Center(
                    child: GestureDetector(
                        child: Container(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: AssetImage("assets/image.jpg"),
                                    fit: BoxFit.cover)),
                            transform: Matrix4.translationValues(
                                0, animation.value * width, 0),
                          ),
                        ),
                        onTap: () {
                          if (flag) {
                            animationController.forward();
                            flag = false;
                          } else {
                            animationController.reverse();
                            flag = true;
                          }
                        } /*,
                  onDoubleTap: () {
                    animationController.reverse();
                  },*/
                        ))
              ],
            ),
          ),
        );
      },
    );
  }
}
