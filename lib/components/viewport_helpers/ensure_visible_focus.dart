import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:flutter/rendering.dart';

class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    Key? key,
    required this.child,
    required this.focusNode,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  /// The node we will monitor to determine if the child is focused
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  @override
  EnsureVisibleWhenFocusedState createState() =>
      EnsureVisibleWhenFocusedState();
}

class EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.removeListener(_ensureVisible);
  }

  Future _ensureVisible() async {
    // await Future.delayed(const Duration(milliseconds: 300));
    if (!widget.focusNode.hasFocus) return;
    final RenderObject? object = context.findRenderObject();
    // final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    // assert(viewport != null);
    ScrollableState? scrollableState = Scrollable.of(context);
    // assert(scrollableState != null);
    ScrollPosition position = scrollableState.position;
    // if (position.pixels > viewport!.getOffsetToReveal(object!, 0.0).offset) {
    //   // Move down to the top of the viewport
    //   alignment = -0.2;
    // } else if (position.pixels <
    //     viewport.getOffsetToReveal(object, 1.0).offset) {
    //   // Move up to the bottom of the viewport
    //   alignment = 1.2;
    // } else {
    //   // No scrolling is necessary to reveal the child
    //   alignment = 0;
    //   // return;
    // }
    position.ensureVisible(
      object!,
      alignment: 1,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
