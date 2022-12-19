import 'package:e_commerce/core/database/daos/delivery_dao.dart';
import 'package:e_commerce/core/database/entities/delivery/delivery_entity.dart';
import 'package:e_commerce/core/services/interfaces/idelivery_serivce.dart';
import 'package:e_commerce/global/locator.dart';

class DeliveryService implements IDeliveryService {
  final _deliveryDao = locator<DeliveryDao>();
  @override
  Future<void> deleteDelivery(Delivery delivery) async {
    await _deliveryDao.deleteById(delivery.id);
  }

  @override
  Delivery? findDeliveryById(int id) {
    return _deliveryDao.findById(id);
  }

  @override
  List<Delivery> getDeliveries() {
    return _deliveryDao.getAllCollection();
  }

  @override
  Future<void> insertDelivery(Delivery delivery) async {
    await _deliveryDao.insert(delivery);
  }

  @override
  Future<void> updateDelivery(Delivery delivery) async {
    await _deliveryDao.updateById(delivery.id, delivery);
  }
}
