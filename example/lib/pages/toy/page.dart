import 'package:flutter/material.dart';
import 'package:state_widget/build_widget.dart';

import 'logic.dart';

class ToyPage extends StatelessWidget {
  const ToyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWidget(
      logic: ToyLogic(context),
      builder: (ToyLogic logic) {
        return Text("ToyPage");
      },
    );
  }
}
