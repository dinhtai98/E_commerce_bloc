import 'package:e_commerce/core/database/entities/delivery/delivery_entity.dart';

abstract class IDeliveryService {
  List<Delivery> getDeliveries();
  Delivery? findDeliveryById(int id);
  Future<void> insertDelivery(Delivery delivery);
  Future<void> deleteDelivery(Delivery delivery);
  Future<void> updateDelivery(Delivery delivery);
}
