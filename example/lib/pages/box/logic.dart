import 'package:state_widget/logic.dart';

import 'state.dart';

class BoxLogic extends Logic<BoxLogic, BoxState> {
  BoxLogic(super.context) {
    put(this, BoxState());
  }

  @override
  void onInit() {
    /*Timer.periodic(Duration(seconds: 1), (timer) {
      print(updateDict.hashCode);
    });*/
  }

  void onWidthPressed() {
    state.width += 10;
    update();
  }

  void onHeightPressed() {
    state.width += 10;
    state.height += 10;
    update(["height"]);
  }
}
