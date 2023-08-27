import 'package:flutter/material.dart';
import 'package:state_widget/build_widget.dart';

import 'logic.dart';

class CBoxPage extends StatelessWidget {
  const CBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C Box Page"),
      ),
      body: buildWidget(
        logic: CBoxLogic(context),
        builder: (logic) {
          return Center(
            child: ElevatedButton(
              onPressed: logic.onUpdateWidthPressed,
              child: const Text("跨页面刷新"),
            ),
          );
        },
      ),
    );
  }
}
