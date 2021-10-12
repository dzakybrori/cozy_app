import 'dart:collection';
import 'dart:convert';

import 'package:cozy_app/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider with ChangeNotifier {
  List<Space> _items = [];

  UnmodifiableListView<Space> get items => UnmodifiableListView(_items);

  UnmodifiableListView<Space> get favItems =>
      UnmodifiableListView(_items.where((element) => element.isFavorite));

  Future<List<Space>> getRecommendedSpaces() async {
    if (_items.isEmpty) {
      var result = await http.get(
        Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'),
      );

      print(result.statusCode);

      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);
        List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
        return spaces;
      } else {
        return <Space>[];
      }
    } else {
      return items;
    }
  }
}
