import 'package:flutter/material.dart';

class StatefulSetter<T> extends StatefulWidget {
  final Widget Function(BuildContext, T) builder;
  final T? initialValue;

  const StatefulSetter({required Key key, required this.builder, this.initialValue})
      : super(key: key);

  @override
  State<StatefulSetter<T>> createState() => StatefulSetterState<T>();

  static void value<T>({required GlobalKey<StatefulSetterState<T>> key, required T value}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      key.currentState!.value = value;
    });
  }
}

class StatefulSetterState<T> extends State<StatefulSetter<T>> {
  T? _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _value != null ? widget.builder(context, _value!) : Container();
  }

  set value(T value) {
    setState(() {
      _value = value;
    });
  }
}