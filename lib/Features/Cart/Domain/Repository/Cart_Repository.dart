import 'package:grocery_mart/Features/Cart/Domain/Entity/Cart_Entity.dart';

abstract class CartRepository {
  Future<void> addItem(CartItemEntity item);
  Future<void> updateItem(CartItemEntity item);
  Future<void> deleteItem(String id);
  Future<List<CartItemEntity>> getItems();
  Future<void> saveItems(List<CartItemEntity> items);
}
