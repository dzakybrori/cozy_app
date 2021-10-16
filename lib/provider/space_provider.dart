import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/space.dart';

class SpaceProvider with ChangeNotifier {
  List<Space> _items = [];
  String _errorMessage = '';

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  UnmodifiableListView<Space> get items => UnmodifiableListView(_items);

  UnmodifiableListView<Space> get favItems =>
      UnmodifiableListView(_items.where((element) => element.isFavorite));

  Future<void> refresh() async {
    _isLoading = true;
    notifyListeners();
    _items.clear();
    await getRecommendedSpaces();
  }

  Future<void> getRecommendedSpaces() async {
    if (_items.isEmpty) {
      _isLoading = true;
      var result = await http.get(
        Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'),
      );

      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);
        List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
        _items = spaces;
      } else {
        print(
            'ERROR SPACE PROVIDER: CODE ${result.statusCode} | BODY: ${result.body}');
        _errorMessage = result.body;
      }
      _isLoading = false;
      notifyListeners();
    }
  }
}
