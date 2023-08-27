import 'package:flutter/material.dart';
import 'package:state_widget/build_widget.dart';

import 'logic.dart';

class BBoxPage extends StatelessWidget {
  const BBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWidget(
      logic: BBoxLogic(context),
      builder: (BBoxLogic logic) {
        return Column(
          children: [
            Text(logic.state.name),
            ElevatedButton(
              onPressed: logic.onWidthPressed,
              child: const Text("跨组件更新：ABox宽度"),
            ),
            ElevatedButton(
              onPressed: logic.onCBoxPagePressed,
              child: const Text("跳转到新页面"),
            ),
          ],
        );
      },
    );
  }
}
