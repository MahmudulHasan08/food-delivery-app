import 'package:flutter/material.dart';
import 'package:fooddeliver/data/controller/cart_controller.dart';
import 'package:fooddeliver/data/repository/popular_product_repo.dart';
import 'package:fooddeliver/modals/products_modal.dart';
import 'package:fooddeliver/modals/products_modal.dart';
import 'package:fooddeliver/utils/appColors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _cartItem = 0;
  int get cartItem => cartItem + _quantity;
  late CartController _cart;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductlist();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int _quantity) {
    if (_quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You can't reduce more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (_quantity > 25) {
      Get.snackbar(
        "Item Count",
        "You can't add more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 25;
    } else {
      return _quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _cartItem = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        print("the id is " +
            value.id!.toString() +
            " the quantity is " +
            value.quantity.toString());
      });
    } else {
      Get.snackbar("Item count", "You should at least an item in the cart");
    }
  }
}
