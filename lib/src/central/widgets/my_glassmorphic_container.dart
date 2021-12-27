import 'dart:ui';

import 'package:flutter/material.dart';

class MyGlassMorphicContainer extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  const MyGlassMorphicContainer({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(start),
                Colors.white.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            // borderRadius: BorderRadius.all(Radius.circular(10)),
            // borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border(
              left: BorderSide(
                //                   <--- left side
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              top: BorderSide(
                //                    <--- top side
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
