import 'package:grocery_mart/Features/Cart/Data/Model/Cart_Entity_Model.dart';
import 'package:grocery_mart/Features/Cart/Domain/Entity/Cart_Entity.dart';
import 'package:grocery_mart/Features/Cart/Domain/Repository/Cart_Repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepositoryImpl implements CartRepository {
  static const String _cartKey = 'cart_items';

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<void> addItem(CartItemEntity item) async {
    final prefs = await _prefs;
    final items = await getItems();
    final updated = [...items, item];

    final models = updated.map((e) => CartItemModel.fromEntity(e)).toList();
    await prefs.setString(_cartKey, CartItemModel.encode(models));
  }

  @override
  Future<void> updateItem(CartItemEntity item) async {
    final prefs = await _prefs;
    final items = await getItems();

    final updated = items.map((e) => e.id == item.id ? item : e).toList();
    final models = updated.map((e) => CartItemModel.fromEntity(e)).toList();
    await prefs.setString(_cartKey, CartItemModel.encode(models));
  }

  @override
  Future<void> deleteItem(String id) async {
    final prefs = await _prefs;
    final items = await getItems();

    final updated = items.where((e) => e.id != id).toList();
    final models = updated.map((e) => CartItemModel.fromEntity(e)).toList();
    await prefs.setString(_cartKey, CartItemModel.encode(models));
  }

  @override
  Future<List<CartItemEntity>> getItems() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_cartKey);
    if (jsonString == null) return [];

    final models = CartItemModel.decode(jsonString);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveItems(List<CartItemEntity> items) async {
    final prefs = await _prefs;
    final models = items.map((e) => CartItemModel.fromEntity(e)).toList();
    await prefs.setString(_cartKey, CartItemModel.encode(models));
  }
}
