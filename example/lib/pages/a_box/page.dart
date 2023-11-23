import 'package:flutter/material.dart';
import 'package:state_widget/build_widget.dart';

import 'logic.dart';

class ABoxPage extends StatelessWidget {
  const ABoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWidget(
      logic: ABoxLogic(context),
      builder: (logic) {
        return Column(
          children: [
            Text(logic.state.name),
            Text("width: ${logic.state.width}"),
            logic.builder(
              id: "height",
              builder: () => Text("height: ${logic.state.height}"),
            ),
            GestureDetector(
              onTap: logic.onWidthAndHeightPressed,
              child: const Text("同时更新高度和宽度"),
            ),
            GestureDetector(
              onTap: logic.onHeightPressed,
              child: const Text("局部更新:仅更新高度"),
            ),
          ],
        );
      },
    );
  }
}
