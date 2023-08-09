import 'package:state_widget/logic.dart';

import 'state.dart';

class ToyLogic extends Logic<ToyLogic, ToyState> {
  ToyLogic(super.context) {
    put(this, ToyState());
  }
}
