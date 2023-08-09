import 'package:flutter/material.dart';
import 'package:state_widget/build_widget.dart';

import 'logic.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildWidget(
      logic: BoxLogic(context),
      builder: (logic) {
        return Column(
          children: [
            Text("${logic.state.width}"),
            logic.builder(
              id: "height",
              builder: () => Text("${logic.state.height}"),
            ),
            ElevatedButton(
              onPressed: logic.onWidthPressed,
              child: const Text("增加宽度"),
            ),
            ElevatedButton(
              onPressed: logic.onHeightPressed,
              child: const Text("增加高度"),
            ),
          ],
        );
      },
    );
  }
}
