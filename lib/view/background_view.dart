import 'package:flutter/material.dart';
import 'package:ipssi_bd23_2/controller/my_custom_arc.dart';
import 'package:ipssi_bd23_2/controller/my_custom_path.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;


  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2)
    );

    _colorAnimation = ColorTween(begin: Colors.purple,end: Colors.deepPurpleAccent).animate(_controller);
    _controller.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: MyCustomArc(165),
          child:  Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white
                )

        ),

        ClipPath(
          clipper: MyCustomArc(160),
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context ,Widget? child) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: _colorAnimation.value!,
              );
            }
          ),
        ),
        ClipPath(
          clipper: MyCustomPath(5),
          child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                )

        ),

        ClipPath(
          clipper: MyCustomPath(0),
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (BuildContext context, Widget? child) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: _colorAnimation.value,
              );
            }
          ),
        ),

        //


      ],
    );
  }
}
