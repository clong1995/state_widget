import 'package:state_widget/logic.dart';

import 'state.dart';

class ABoxLogic extends Logic<ABoxLogic, ABoxState> {
  ABoxLogic(super.context) {
    put(this, ABoxState());
  }

  //同时更新宽度和高度
  void onWidthAndHeightPressed() {
    state.width += 10;
    state.height += 10;
    update();
  }

  //仅更新高度
  void onHeightPressed() {
    //宽度虽然被增加了，但是不会被更新
    state.width += 10;
    //只有高度会被更新
    state.height += 10;
    update(["height"]);
  }


  //同时更新宽度和高度
  void onWidthPressed() {
    state.width += 10;
    update();
  }
}
