import 'package:state_widget/logic.dart';

import '../a_box/logic.dart';

class CBoxLogic extends Logic<CBoxLogic, dynamic> {
  CBoxLogic(super.context) {
    put(this, dynamic);
  }

  void onUpdateWidthPressed() {
    ABoxLogic? aBoxLogic = find<ABoxLogic>();
    aBoxLogic?.onWidthPressed();
  }
}
