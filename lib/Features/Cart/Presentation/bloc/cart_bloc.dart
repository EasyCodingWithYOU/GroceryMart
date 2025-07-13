import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mart/Features/Cart/Domain/Entity/Cart_Entity.dart';
import 'package:grocery_mart/Features/Cart/Domain/Repository/Cart_Repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddCart>(_onAddCart);
    on<DeleteCart>(_onDeleteCart);
    on<UpdateCart>(_onUpdateCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await repository.getItems();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to load cart: ${e.toString()}"));
    }
  }

  Future<void> _onAddCart(AddCart event, Emitter<CartState> emit) async {
    await repository.addItem(event.item);
    add(LoadCart());
  }

  Future<void> _onDeleteCart(DeleteCart event, Emitter<CartState> emit) async {
    await repository.deleteItem(event.id);
    add(LoadCart());
  }

  Future<void> _onUpdateCart(UpdateCart event, Emitter<CartState> emit) async {
    await repository.updateItem(event.item);
    add(LoadCart());
  }

  Future<void> _onIncreaseQuantity(
    IncreaseQuantity event,
    Emitter<CartState> emit,
  ) async {
    final items = await repository.getItems();
    final updatedItems = items.map((item) {
      if (item.id == event.id) {
        return CartItemEntity(
          id: item.id,
          imageUrl: item.imageUrl,
          name: item.name,
          quantity: item.quantity,
          price: item.price,
          favourite: item.favourite,
          productDetail: item.productDetail,
          nutrition: item.nutrition,
          review: item.review,
          rating: item.rating,
          orderQuantity: item.orderQuantity + 1,
        );
      }
      return item;
    }).toList();

    await repository.saveItems(updatedItems);
    emit(CartLoaded(updatedItems));
  }

  Future<void> _onDecreaseQuantity(
    DecreaseQuantity event,
    Emitter<CartState> emit,
  ) async {
    final items = await repository.getItems();
    final updatedItems = items.map((item) {
      if (item.id == event.id && item.orderQuantity > 1) {
        return CartItemEntity(
          id: item.id,
          imageUrl: item.imageUrl,
          name: item.name,
          quantity: item.quantity,
          price: item.price,
          favourite: item.favourite,
          productDetail: item.productDetail,
          nutrition: item.nutrition,
          review: item.review,
          rating: item.rating,
          orderQuantity: item.orderQuantity - 1,
        );
      }
      return item;
    }).toList();

    await repository.saveItems(updatedItems);
    emit(CartLoaded(updatedItems));
  }
}
