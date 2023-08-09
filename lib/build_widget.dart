import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'logic.dart';
import 'logic_dict.dart';

Widget buildWidget<T extends Logic>({
  required T logic,
  required Widget Function(T) builder,
}) {
  if (kDebugMode) {
    T? dupleLogic = LogicDict.get<T>();
    if (dupleLogic != null) {
      logic = dupleLogic;
    }
  }

  return _StateWidget<T>(
    logic: logic,
    builder: builder,
  );
}

class _StateWidget<T extends Logic> extends StatefulWidget {
  final T logic;
  final Widget Function(T) builder;

  const _StateWidget({
    required this.logic,
    required this.builder,
  });

  @override
  State<_StateWidget<T>> createState() => _StateWidgetState<T>();
}

class _StateWidgetState<T extends Logic> extends State<_StateWidget<T>> {
  @override
  void initState() {
    super.initState();
    LogicDict.set<T>(widget.logic);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      widget.logic.initDict(() => setState(() {}));
      widget.logic.onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(widget.logic);
  }

  @override
  void dispose() {
    super.dispose();
    LogicDict.remove<T>();
    widget.logic.onDispose();
  }
}
