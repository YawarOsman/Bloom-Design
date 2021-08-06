import 'package:cached_image/circle.dart';
import 'package:flutter/material.dart';

class Bloom extends StatefulWidget {
  @override
  _BloomState createState() => _BloomState();
}

class _BloomState extends State<Bloom> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;
  Tween<double> tween = Tween(begin: 1, end: 0);
  bool state=false;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 700),value: 4);
    animation=tween.animate(controller);
    controller.addListener(() {setState(() { });});

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: 0.758*tween.animate(controller).value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circles(tween: tween.animate(controller).value),
                  Circles(tween: tween.animate(controller).value),
                ],
              ),
            ),
            Transform.rotate(
              angle: 0.758*tween.animate(controller).value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circles(tween: tween.animate(controller).value),
                  Circles(tween: tween.animate(controller).value),
                ],
              ),
            ),
            Transform.rotate(
              angle: 0.785*tween.animate(controller).value+0.785,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circles(tween: tween.animate(controller).value),
                  Circles(tween: tween.animate(controller).value),
                ],
              ),
            ),
            Transform.rotate(
              angle: -0.785*controller.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Circles(tween: tween.animate(controller).value),
                  Circles(tween: tween.animate(controller).value),
                ],
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(state==true){
              state=false;
              controller.reverse();
            }else{
              controller.forward();
              state=true;
            }


          });

        },
        child: Text("play"),backgroundColor: Colors.green[400],
      ),
    );
  }
}