import 'package:flutter/material.dart';

import 'logic_dict.dart';

abstract class Logic<T, E> {
  final Map<String, void Function()> _updateDict = {
    "a": () {},
  };

  late E _state;

  E get state => _state;

  final BuildContext _context;

  BuildContext get context => _context;

  Logic(this._context);

  void onInit() {}

  void onDispose() {}

  void put(T logic, E state) {
    _state = state;
  }

  S? find<S>() => LogicDict.get<S>();

  void initDict(void Function() update) {
    // print(_updateDict.hashCode);
    if (_updateDict.containsKey("_")) {
      return;
    }
    _updateDict["_"] = update;
  }

  void update([List<String>? ids]) {
    // print(_updateDict.hashCode);
    if (ids != null) {
      _updateDict.forEach((key, func) {
        if (ids.contains(key)) func.call();
      });
    } else {
      _updateDict["_"]?.call();
    }
  }

  Widget builder({
    required String id,
    required Widget Function() builder,
  }) {
    return _BuildChildWidget(
      onInit: (void Function() update) {
        _updateDict[id] = update;
      },
      builder: builder,
    );
  }

  void pop<S>([S? result]) => Navigator.maybePop<S>(
        _context,
        result,
      );

  Future<S?> push<S>(Widget Function() page, [Object? arguments]) =>
      Navigator.push<S>(
        _context,
        MaterialPageRoute<S>(
          builder: (BuildContext context) => page(),
          settings: RouteSettings(
            arguments: arguments,
          ),
        ),
      );

  Future<S?> pushAndRemove<S>(Widget Function() page, [Object? arguments]) =>
      Navigator.pushAndRemoveUntil<S>(
        _context,
        MaterialPageRoute<S>(
          builder: (BuildContext context) => page(),
          settings: RouteSettings(
            arguments: arguments,
          ),
        ),
        (Route<dynamic> route) => false,
      );

  S? arguments<S>() {
    Object? arguments = ModalRoute.of(_context)?.settings.arguments;
    if (arguments == null) {
      return null;
    }
    return arguments as S;
  }
}

class _BuildChildWidget extends StatefulWidget {
  final void Function(void Function() update) onInit;
  final Widget Function() builder;

  const _BuildChildWidget({
    required this.builder,
    required this.onInit,
  });

  @override
  State<_BuildChildWidget> createState() => _BuildChildWidgetState();
}

class _BuildChildWidgetState extends State<_BuildChildWidget> {
  @override
  void initState() {
    super.initState();
    widget.onInit(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => widget.builder();
}
