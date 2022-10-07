import 'package:flutter/material.dart';

class AnimationEaseIn extends StatefulWidget {
  final Widget child;
  final Tween<Offset> tween;
  final Duration delay;
  final Duration animationDuration;
  const AnimationEaseIn({
    Key? key,
    required this.child,
    required this.tween,
    required this.delay,
    required this.animationDuration,
  }) : super(key: key);

  @override
  State<AnimationEaseIn> createState() => _AnimationEaseInState();
}

class _AnimationEaseInState extends State<AnimationEaseIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationBackgroundBottomChangeController;
  late final Animation<Offset> _animationBackgroundBottomChange =
      widget.tween.animate(CurvedAnimation(
    parent: _animationBackgroundBottomChangeController,
    curve: Curves.easeIn,
  ));
  @override
  void initState() {
    _animationBackgroundBottomChangeController =
        AnimationController(duration: widget.animationDuration, vsync: this);
    Future.delayed(widget.delay, () {
      _animationBackgroundBottomChangeController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationBackgroundBottomChangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animationBackgroundBottomChange,
      child: widget.child,
    );
  }
}
