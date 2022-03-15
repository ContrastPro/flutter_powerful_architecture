
import 'package:file_structure_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({
    Key? key,
    this.curve = kCurveAnimations,
    this.duration = kAnimationDuration,
    this.placeholder,
    required this.child,
  }) : super(key: key);

  final Curve curve;
  final Duration duration;
  final Widget? placeholder;
  final Widget child;

  @override
  _FadeInAnimationState createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _setInitialData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setInitialData() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.placeholder != null) widget.placeholder!,
        FadeTransition(
          opacity: _animation,
          child: widget.child,
        ),
      ],
    );
  }
}
