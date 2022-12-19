import 'package:e_commerce/core/database/entities/account_entity.dart';
import 'package:e_commerce/core/ui_models/basket_ui_model.dart';

class GlobalData {
  GlobalData();
  String currencySymbol = '\$';
  List<BasketUIModel> basketList = [];
  Account? currentAccount;
}
