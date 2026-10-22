import 'package:flutter/foundation.dart';
import '../models/book.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, Book> _items = {};
  final Map<String, int> _quantities = {};

  Map<String, Book> get items => Map.unmodifiable(_items);

  int get totalItems =>
      _quantities.values.fold(0, (total, quantity) => total + quantity);

  int get totalPrice {
    int total = 0;

    _items.forEach((id, book) {
      total += book.price * (_quantities[id] ?? 0);
    });

    return total;
  }

  int quantityOf(String bookId) => _quantities[bookId] ?? 0;

  void addItem(Book book) {
    _items[book.id] = book;
    _quantities.update(
      book.id,
      (quantity) => quantity + 1,
      ifAbsent: () => 1,
    );
    notifyListeners();
  }

  void removeItem(String bookId) {
    if (!_quantities.containsKey(bookId)) return;

    if (_quantities[bookId]! > 1) {
      _quantities[bookId] = _quantities[bookId]! - 1;
    } else {
      _quantities.remove(bookId);
      _items.remove(bookId);
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _quantities.clear();
    notifyListeners();
  }
}
