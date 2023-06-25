import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  int _notificationCount = 0;
  int _cartCount = 0;
  int _favoritesCount = 0;

  int get notificationCount => _notificationCount;
  int get cartCount => _cartCount;
  int get favoritesCount => _favoritesCount;

  void incrementNotificationCount() {
    _notificationCount++;
    notifyListeners();
  }

  void decrementNotificationCount() {
    if (_notificationCount > 0) {
      _notificationCount--;
      notifyListeners();
    }
  }

  void incrementCartCount() {
    _cartCount++;
    notifyListeners();
  }

  void decrementCartCount() {
    if (_cartCount > 0) {
      _cartCount--;
      notifyListeners();
    }
  }

  void incrementFavoritesCount() {
    _favoritesCount++;
    notifyListeners();
  }

  void decrementFavoritesCount() {
    if (_favoritesCount > 0) {
      _favoritesCount--;
      notifyListeners();
    }
  }
}
