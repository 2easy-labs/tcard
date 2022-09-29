import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../tcard.dart';

/// Card controller
class TCardController {
  TCardState? state;

  void bindState(TCardState state) {
    this.state = state;
  }

  int get index => state?.frontCardIndex ?? 0;

  int getRealIndex() {
    if (state != null) {
      if (state!.frontCardIndex >= state!.originCardSize) {
        return state!.frontCardIndex % state!.originCardSize;
      } else {
        return state!.frontCardIndex;
      }
    } else {
      return 0;
    }
  }

  void forward({SwipeDirection? direction}) {
    direction ??=
        Random().nextBool() ? SwipeDirection.Left : SwipeDirection.Right;

    state!.swipeInfoList.add(SwipeInfo(state!.frontCardIndex, direction));
    state!.runChangeOrderAnimation();
  }

  void back() {
    state!.runReverseOrderAnimation();
  }

  void reset({List<Widget>? cards, bool? refresh}) {
    state!.reset(cards: cards, refresh: refresh);
  }

  void append(List<Widget> cards) {
    state!.append(cards);
  }

  int get itemSize => state!.currentCardSize;

  void dispose() {
    state = null;
  }
}
