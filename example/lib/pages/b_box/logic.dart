import 'package:state_widget/logic.dart';
import 'package:state_widget_example/pages/a_box/logic.dart';
import 'package:state_widget_example/pages/c_box/page.dart';

import 'state.dart';

class BBoxLogic extends Logic<BBoxLogic, BBoxState> {
  BBoxLogic(super.context) {
    put(this, BBoxState());
  }

  void onWidthPressed(){
    ABoxLogic? aBoxLogic = find<ABoxLogic>();
    aBoxLogic?.onWidthPressed();
  }

  void onCBoxPagePressed(){
    push(() => const CBoxPage());
  }
}
