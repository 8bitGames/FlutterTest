import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({
    super.key,
  });

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var registry;
  // ignore: prefer_typing_uninitialized_variables
  var _data;

  // ignore: non_constant_identifier_names
  Future InitJson() async {
    registry = JsonWidgetRegistry.instance;
    final jsonStr = await rootBundle.loadString('assets/json/all.json');
    final jsonData = json.decode(jsonStr);
    _data = JsonWidgetData.fromDynamic(jsonData);
  }

  @override
  void initState() {
    super.initState();
    InitJson();
  }

  @override
  Widget build(BuildContext context) {
    return _data.build(context, registry: registry);
  }
}
